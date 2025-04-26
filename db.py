# db.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
import config

URL = (
    f"postgresql+psycopg2://"
    f"{config.DB_USER}:{config.DB_PASSWORD}"
    f"@{config.DB_HOST}:{config.DB_PORT}/{config.DB_NAME}"
)

engine = create_engine(URL, echo=False)
Session = sessionmaker(bind=engine)
