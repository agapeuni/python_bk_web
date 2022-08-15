## Pybo (Flask)

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
set FLASK_APP=pybo
set FLASK_ENV=development

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
pip install Flask
pip install Flask-Migrate
pip install Flask-SQLAlchemy
pip install Flask-WTF
pip install email_validator
pip install Flask_Markdown

pip install autopep8
pip install twine
pip install wheel

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
flask db init
flask db migrate
flask db upgrade

> flask shell
from pybo.models import Question, Answer
from datetime import datetime
from pybo import db

q = Question(subject='What is pybo?', content='I want to know pybo', create_date=datetime.now())
db.session.add(q)
db.session.commit()

q = Question(subject='플라스크 모델 질문입니다.', content='id는 자동으로 생성되나요?', create_date=datetime.now())
db.session.add(q)
db.session.commit()

Question.query.all()

Question.query.get(2)
q.subject = 'Flask Model Question'
db.session.commit()

q = Question.query.get(2)
a = Answer(question=q, content='네 자동으로 생성됩니다.', create_date=datetime.now())
db.session.add(a)
db.session.commit()

>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
> flask shell
from pybo import db
from pybo.models import Question
from datetime import datetime
for i in range(300):
    q = Question(subject='테스트 데이터입니다:[%03d]' % i, content='내용무', create_date=datetime.now(), user_id='1')
    db.session.add(q)

db.session.commit()
