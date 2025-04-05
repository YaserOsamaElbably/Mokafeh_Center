# Mokafeh Center

Mokafeh Center is a database project designed to manage various operations within a center, including employee management, sales tracking, and categorization of expenses and income. This project includes the SQL schema for setting up the necessary tables and sample data.

## Table of Contents

- [Installation](#installation)
- [Database Schema](#database-schema)
- [Usage](#usage)
- [Contributing](#contributing)
- [License](#license)
- [Contact](#contact)

## Installation

To set up the database, follow these steps:

1. Ensure you have MySQL or MariaDB installed on your system.
2. Clone the repository:
    ```bash
    git clone https://github.com/YaserOsamaElbably/Mokafeh_Center.git
    cd Mokafeh_Center
    ```
3. Import the SQL file into your database:
    ```bash
    mysql -u your_username -p your_database_name < mokafeh.sql
    ```

## Database Schema

The database includes the following tables:

- `categories`: Stores various categories for expenses and income.
- `dimdate`: Stores date information for use in other tables.
- `employees`: Stores employee information.
- `factsales`: Stores sales data.
- `types`: Stores types of transactions (e.g., import, export).

### Table: `categories`

| Column | Type        | Description              |
|--------|-------------|--------------------------|
| id     | int(11)     | Primary key              |
| name   | varchar(30) | Name of the category     |

### Table: `dimdate`

| Column  | Type    | Description        |
|---------|---------|--------------------|
| Date    | date    | Primary key        |
| day     | int(11) | Day of the month   |
| month   | int(11) | Month of the year  |
| quarter | int(11) | Quarter of the year|
| year    | int(11) | Year               |

### Table: `employees`

| Column         | Type        | Description              |
|----------------|-------------|--------------------------|
| id             | int(11)     | Primary key              |
| first_name     | varchar(25) | First name of the employee|
| last_name      | varchar(25) | Last name of the employee |
| password       | varchar(50) | Password for the employee |
| e_mail         | varchar(50) | Email address            |
| phone_number   | varchar(15) | Phone number             |
| created_at     | date        | Date of creation         |
| updated_at     | date        | Date of last update      |
| birth_day      | date        | Birth date               |
| gender         | varchar(6)  | Gender                   |
| supervising_id | int(11)     | ID of the supervising employee |

### Table: `factsales`

| Column      | Type    | Description              |
|-------------|---------|--------------------------|
| id          | int(11) | Primary key              |
| value       | float   | Value of the sale        |
| Date        | date    | Date of the sale         |
| employee_id | int(11) | ID of the employee       |
| category_id | int(11) | ID of the category       |
| type_id     | int(11) | ID of the transaction type|

### Table: `types`

| Column | Type        | Description              |
|--------|-------------|--------------------------|
| id     | int(11)     | Primary key              |
| name   | varchar(10) | Name of the transaction type|

## Usage

Once the database is set up, you can use it to manage and track various operations within the center. The tables are designed to store and organize data efficiently, allowing for easy querying and reporting.

## Contributing

Contributions are welcome! Please follow these steps to contribute:

1. Fork the repository.
2. Create a new branch:
    ```bash
    git checkout -b feature-branch
    ```
3. Make your changes and commit them:
    ```bash
    git commit -m "Description of changes"
    ```
4. Push to the branch:
    ```bash
    git push origin feature-branch
    ```
5. Create a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contact

For questions or support, please contact Yaser Osama Elbably at [your_email@example.com].
