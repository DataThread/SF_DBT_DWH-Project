<<<<<<< HEAD
# SF_DBT_DWH Project

Welcome to the SF_DBT_DWH project repository! This project focuses on building a data warehouse using dbt (data build tool) on Snowflake. It includes staging, operational data store (ODS), and data mart (DM) layers along with various models and transformations.

## Project Structure

### Models Directory

The project's models are organized into three main directories:

- **STG**: Contains models related to staging data from source systems.
- **ODS**: Includes models for building the operational data store layer.
- **DM**: Consists of models for constructing the data mart layer.

Each directory contains SQL files defining dbt models for different purposes.

### Macros Directory

The `macros` directory holds reusable SQL macros used across the project. Macros enable us to define custom SQL logic that can be reused in multiple models.

### Seeds Directory

The `seeds` directory contains CSV files used to seed reference data into the database. Reference data is essential for creating dimensions and enriching analytical queries.

### Snapshots Directory

The `snapshots` directory stores snapshot models. Snapshot models capture historical data at specific points in time, allowing us to track changes and perform temporal analysis.

## Continuous Integration and Deployment (CI/CD)

We have implemented a CI/CD pipeline using dbt to automate the testing, building, and deployment processes. The pipeline ensures that changes to the dbt project are thoroughly tested and deployed consistently.

## Available Tables

The following tables are available in the SF_DBT_DWH_DB database under the DEV schema:

- **Customers**
- **Products**
- **Sales**
- **Stores**
- **Time**
- **Employee**
- **Employee_Sales**
- **Promotions**
- **Sales_Promotions**
- **Inventory_Snapshot**

## Seed Data

The project includes a seed file named `regions.csv`, which contains data about different regions.

## dbt Configuration

The project is configured using the `dbt_project.yml` file, which specifies model paths, profiles, clean targets, and other settings. For more details, refer to the updated `dbt_project.yml` file.

For any inquiries or issues, feel free to reach out to the project maintainers.

Happy modeling!
=======
Welcome to your new dbt project!

### Using the starter project

Try running the following commands:
- dbt run
- dbt test


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
>>>>>>> f499807 ("first commit")
