### Postgresql

---

Podklady z tutoriálu na Udemy.

<br>

#### Úvod

---

Adresář `data` obsahuje základní data (zip soubory), které slouží jako podklady
pro jednotlivé ukázky.

Adresář `queries` obsahuje jednotlivé kapitoly, které popisují základní
příkazy pro Postgresql.

<br>

#### Instalace

---

Pomocí příkazu `./build.sh` vytvořit konfiguráky:
```
./build.sh
INFO:...
```
Potom doplnit údaje v souborech:
- `config/jupyter.env`
- `config/postgres.env`
- `config/pgadmin.env`

<br>

#### Spouštění

---

Pomocí příkazu:
```
docker-compose up --d
```
zapni všechny služby Jupyter, Postgresql, Pgadmin4.

Na adrese:
```
localhost:<port>
```
je přihlaš jako uživatel pro Pgadmin4.

<br>

#### Spouštění přes interpret Pythonu

---

Sbírání dat z lokální databáze pomocí `psycopg2`:
```python
import psycopg2

# klasický zápis
conn = psycopg2.connect(
    database="<jmeno_db>",
    user="<jmeno_uzivatele>",
)

cur = conn.cursor()
cur.execute("SELECT * FROM payment")
result = cur.fetchone()

print(result)

conn.close()

# context manager
with psycopg2.connect(
    database="<jmeno_db>", user="<jmeno_uzivatele>"
) as conn:
    cur = conn.cursor()
    cur.execute("SELECT * FROM <table>")
    result = cur.fetchone()

    print(result)
```
