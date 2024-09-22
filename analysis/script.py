import dask.dataframe as dd
import pandas as pd
from sqlalchemy import create_engine

# Configurar la conexión a la base de datos SQL Server
server = 'host.docker.internal'  # Servidor SQL Server
database = 'MovieLens'
username = 'SA'
password = 'StrongPass123!'
connection_string = f'mssql+pyodbc://{username}:{password}@{server}/{database}?driver=ODBC+Driver+17+for+SQL+Server'

# Crear el engine para SQLAlchemy
engine = create_engine(connection_string)

# Cargar la tabla 'Ratings' en un DataFrame de pandas
query = "SELECT * FROM ratings"
pdf = pd.read_sql(query, engine)

# Convertir el DataFrame de pandas a un DataFrame de Dask
ddf = dd.from_pandas(pdf, npartitions=3)

# Análisis simple: calcular el promedio de las calificaciones por película
average_ratings = ddf.groupby('MovieID').Rating.mean().compute()

# Mostrar los resultados
print(average_ratings)

# Otra opción: Calcular la cantidad de calificaciones por cada película
rating_counts = ddf.groupby('MovieID').Rating.count().compute()

print(rating_counts)
