# NYC 311 Service Request Analytics

This project analyzes NYC 311 service request data using Python, SQLite, and SQL. I built this project to practice working with a real public dataset by cleaning the data, storing it in a database, exploring it with SQL, and creating visualizations to better understand complaint trends and service performance.

---

## Project Overview

The project uses a sample of NYC 311 service requests from 2024. The data is cleaned using Python, loaded into a SQLite database, analyzed with SQL, and visualized using Matplotlib.

The goal is to practice the complete data analysis workflow, from raw data to meaningful insights.

---

## Questions Explored

During the analysis, I explored questions such as:

- Which boroughs receive the most service requests?
- What are the most common complaint types?
- Which complaint types take the longest to resolve?
- Which agencies handle the most requests?
- How do complaint volume and resolution time change throughout the year?

---

## Tools Used

- Python 3.11
- Pandas
- SQLite
- SQL
- Matplotlib
- Git & GitHub
- VS Code

---

## Dataset

**Source:** NYC Open Data – 311 Service Requests

The project uses a cleaned sample of approximately **59,000 closed NYC 311 service requests from 2024**.

The dataset includes information such as:

- Complaint type
- Borough
- Agency
- Created date
- Closed date
- Resolution time
- ZIP code
- Geographic coordinates

---

## Project Structure

```text
nyc-311-service-request-analytics/

├── data/
│   ├── raw/
│   └── processed/
│
├── src/
│   ├── Download data
│   ├── Extract data
│   ├── Clean data
│   ├── Load SQLite database
│   └── Create visualizations
│
├── sql/
│   ├── Basic checks
│   ├── KPI queries
│   ├── Borough analysis
│   ├── Complaint analysis
│   ├── Resolution time analysis
│   └── Monthly trends
│
├── dashboard/
│   ├── Python charts
│   └── Dashboard notes
│
├── docs/
│   ├── Architecture
│   ├── Methodology
│   ├── Data dictionary
│   ├── Analysis summary
│   └── Business recommendations
│
├── requirements.txt
└── README.md
```

---

## Project Workflow

1. Download the data
2. Clean and prepare the data using Python
3. Load the cleaned data into SQLite
4. Analyze the data using SQL
5. Create visualizations with Python
6. Document the results

---

## Key Findings

Some of the main findings include:

- Brooklyn had the highest number of service requests.
- Illegal Parking was the most common complaint type.
- NYPD handled the largest number of requests.
- Staten Island had the longest average resolution time.
- Complaint volume remained fairly consistent throughout the year.
- Resolution time changed more throughout the year than complaint volume.

---

## Visualizations

The project includes visualizations for:

- Complaints by borough
- Top complaint types
- Agency workload
- Average resolution time by borough
- Monthly complaint volume
- Monthly average resolution time
- Slowest common complaint types

---

## How to Run

Clone the repository:

```bash
git clone <repository-url>
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate the virtual environment (macOS/Linux):

```bash
source venv/bin/activate
```

Install the required packages:

```bash
pip install -r requirements.txt
```

Run the Python scripts:

```bash
python src/00_download_monthly_sample.py
python src/01_extract_311_data.py
python src/02_clean_311_data.py
python src/03_load_to_sqlite.py
python src/05_create_visualizations.py
```

Run the SQL analysis:

```bash
sqlite3 data/processed/nyc_311.db < sql/01_basic_checks.sql
```

---

## Future Improvements

Some ideas for extending this project include:

- Build an interactive dashboard in Power BI.
- Analyze multiple years of NYC 311 data.
- Add automated data validation checks.
- Create interactive visualizations.

---

## Author

I built this project to practice working with real-world data using Python, SQL, and SQLite. It is part of my data analytics portfolio and reflects the skills I have been developing in data cleaning, SQL analysis, data visualization, and documentation.
