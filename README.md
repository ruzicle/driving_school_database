# Driving School Management Database
This project focuses on the architectural design and implementation of a relational database for a driving school. It covers student enrollment, instructor scheduling, vehicle maintenance, and exam results.

## Data Models
### Conceptual Model
![Conceptual Model](conceptual_model.png)

### Relational Schema
![Relational Schema](relational_schema.png)

## Technical Highlights
- **Schema Design:** Fully normalized database structure to ensure data integrity.
- **Relational Integrity:** Extensive use of Primary and Foreign Keys (`ON DELETE CASCADE`) across 10+ tables.
- **Business Logic:** Implemented PL/pgSQL triggers (e.g., `kontrola_limitu_zkousek`) to enforce rules like a 3-attempt exam limit.
- **Analytical Querying:** Advanced SQL scripts for reporting instructor workload and student success rates.

## Repository Structure
- `schema.sql`: Database structure, constraints, and triggers.
- `queries.sql`: Practical examples of analytical queries.
