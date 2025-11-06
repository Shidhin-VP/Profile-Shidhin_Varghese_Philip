from fastapi import FastAPI, Request
from fastapi.middleware.cors import CORSMiddleware
from fastapi.responses import JSONResponse
# from pydantic import BaseModel 
from langchain.agents import create_react_agent
from langchain_core.prompts import ChatPromptTemplate
# from langchain.memory import ConversationBufferMemory
# from langchain.chains.llm import LLMChain 
from langchain_cerebras import ChatCerebras
from dotenv import load_dotenv
import os 

load_dotenv()

llm=ChatCerebras(
    model="llama-3.3-70b",
    api_key=os.getenv("CEREBRAS_API_KEY")
)

print(f"Testing")


work_experience=[
      {
    "position":"AI Software Engineer",
    "company":"The Reflective Lotus",
    "period":"May 2025 - Present",
    "details":""
  },
  {
    "position":"Embedded Software Engineer",
    "company":"Midea America Research Center",
    "period":"Dec 2024 - May 2025",
    "details":""
  },{
    "position":"Embedded Software Engineer",
    "company":"Midea America Research Center",
    "period":"Aug 2024 - Dec 2024",
    "details":""
  },{
    "position":"AI Software Engineer",
    "company":"Girls C.A.N.",
    "period":"Jan 2024 - April 2024",
    "details":""
  },{
    "position":"Software Engineer",
    "company":"Shiash Solutions Private Limited",
    "period":"Jan 2020 - Apr 2020",
    "details":""
  },
]
certifications=[
      {
    'title': "SnowPro Core", 
    'subTitle': 'Snowflake',
    'link':"https://achieve.snowflake.com/bbbbfedf-b3b7-40a9-accf-02b42a1933ea#acc.ob9pYhPf",
    'gitHub':'',
  }
]
publications=[
      {
    'title':'SmartVis',
    'subTitle':'PyLibrary',
    'link':'https://pypi.org/project/smartvis/',
    'gitHub':'https://github.com/Shidhin-VP/SmartVis',
  }
]
educations=[
    {
    'Level': "Masters", 
    'Major': 'Artificial Intelligence',
    'Year':"2023 - 2025",
    'University': "University of Cincinnati"
  }, 
    {
    'Level': "Masters", 
    'Major': 'Computer Science and Engineering',
    'Year':"2020 - 2022",
    'University': "Amal Jyothi College of Engineering"
  }, 
    {
    'Level': "Bachelors", 
    'Major': 'Computer Science and Engineering',
    'Year':"2016 - 2020",
    'University': "Aarupadai Veedu Institute Of Technology"
  }, 
]
things_I_Love=[]
professionalizedSkills=["AI Development", "AI Engineering", "Data Science", "iOS Development", "Android Development", " Desktop Development", "Cloud Platform", "Full Stack Development"]
individualSkills=["Python", "Flutter", "LLM", "Langgraph", "Langchain", "Hugging Face", "Terraform", "AWS", "GCP", "Snowflake", "And More"]

system=f"""
You are My Persornal Assistant and Others will ask about me to you.\n And if the Question is not about me, tell the User they can only ask about me.  \n
I am Shidhin Varghese Philip, I recently Graduated (May 2025) with a Master's Degreen in Artificial Intelligence from the University of Cincinnati.\n
You know everything about me Professionally and you have all the detail about my Educations: {"educations"} Work Experiences: {"work_experience"}, Certifications: {"certifications"}, Publications: {"publications"}.\n
You also have access to my Professional Tech Stack Experience: {professionalizedSkills}, and also to each skill sets, this can be more than that but just to mention to the question asker: {individualSkills} \n
Also, You can mention how I can help a project with my skills if the user is asking how well I will perform for a particular project that they are asking. \n
What I love: {things_I_Love}\n
"""

prompt=ChatPromptTemplate.from_messages(
    [
        ('system',system),
        ('human',"{text}")
    ]
)

chain=prompt|llm

print(chain.invoke({"text":"Can shidhin build Applications"}).content)
print("-"*50)
print(chain.invoke({"text":"What types?"}).content)

app=FastAPI(title="Shidhin's Personal Assistant")

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/")
def root():
    return {"message":"Hello! This is Shidhin's Assistant API. Please Use /ask endpoint"}


@app.post("/ask")
async def ask(request: Request):
    data=await request.json()
    user_question=data.get("question","")
    if not user_question:
        return JSONResponse({"Error":"Question not Provided"},status_code=400)

    response=chain.invoke({"text":user_question}).content
    return {"answer":response}