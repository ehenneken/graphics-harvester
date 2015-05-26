from sqlalchemy import Column, Integer, String, DateTime, Boolean
from sqlalchemy.dialects import postgresql
from flask.ext.sqlalchemy import SQLAlchemy

db = SQLAlchemy()

class GraphicsModel(db.Model):
    __tablename__ = 'graphics'
    __bind_key__ = 'graphics'
    id = Column(Integer, primary_key=True)
    bibcode = Column(String, nullable=False, index=True)
    doi = Column(String)
    source = Column(String)
    eprint = Column(Boolean)
    figures = Column(postgresql.JSON)
    modtime = Column(DateTime)
