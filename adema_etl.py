import pandas as pd
from sqlalchemy import create_engine
from dotenv import load_dotenv
import os

load_dotenv()

engine = create_engine(f"mysql+mysqlconnector://root:Alisher99!@localhost/adema_portfolio")

print("[EXTRACT] Читаем файл...")
df = pd.read_csv(
    'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Amazon Sale Report.csv',
    encoding='utf-8',
    on_bad_lines='skip'
)

print(f"[EXTRACT] Загружено строк: {len(df):,}")

# Переименовываем колонки
df.columns = [
    'index', 'order_id', 'order_date', 'status', 'fulfilment',
    'sales_channel', 'ship_service_level', 'style', 'sku', 'category',
    'size', 'asin', 'courier_status', 'qty', 'currency', 'amount',
    'ship_city', 'ship_state', 'ship_postal_code', 'ship_country',
    'promotion_ids', 'b2b', 'fulfilled_by', 'unnamed'
]

# Убираем лишние колонки
df = df.drop(columns=['index', 'unnamed'], errors='ignore')

# Чистим данные
df['amount'] = pd.to_numeric(df['amount'], errors='coerce')
df['qty'] = pd.to_numeric(df['qty'], errors='coerce')
df['b2b'] = df['b2b'].map({'True': 1, 'False': 0})

print(f"[TRANSFORM] Колонки: {df.columns.tolist()}")
print(f"[TRANSFORM] Строк после очистки: {len(df):,}")

print("[LOAD] Загружаем в staging_amazon...")
df.to_sql('staging_amazon', con=engine, if_exists='replace', index=False, chunksize=5000)
print("[LOAD] Готово!")
print("=== ETL PIPELINE FINISHED ===")