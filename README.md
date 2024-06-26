# Hogwarts Library Management System

Welcome to the Hogwarts Library Management System! This application is designed to manage the books and members of the Hogwarts Library. It allows users to add, view, and manage books and member details, providing a user-friendly interface for library administration.

## Table of Contents
- [Project Overview](#project-overview)
- [Features](#features)
- [Technologies Used](#technologies-used)
- [Setup and Installation](#setup-and-installation)
- [Usage](#usage)
- [API Endpoints](#api-endpoints)
- [Database Schema](#database-schema)
- [Contributing](#contributing)
- [License](#license)
- [Acknowledgements](#acknowledgements)

## Project Overview

The Hogwarts Library Management System is an Angular-based application with a backend powered by ASP.NET Core and MSSQL. It allows librarians to manage book rentals, purchases, and member information efficiently.

## Features

- **Book Management**: Add, view, update, and delete books in the library.
- **Member Management**: Manage library members and their details.
- **Rent/Buy Books**: Rent and buy books with user inputs for book name and rental duration.
- **Responsive Design**: A user-friendly interface that works across various devices.
- **Navigation**: Easy navigation between Home, About, Services, Contact, Member List, and Book List pages.

## Technologies Used

- **Frontend**: Angular
- **Backend**: ASP.NET Core
- **Database**: MSSQL
- **Styling**: CSS
- **Deployment**: Vercel

## Setup and Installation

Follow these steps to set up the project locally:

1. **Clone the repository**:
   ```bash
   git clone https://github.com/yourusername/Hogwarts-Library-Management-System.git
   cd Hogwarts-Library-Management-System
   ```

2. **Install frontend dependencies**:
   ```bash
   cd Frontend
   npm install
   ```

3. **Install backend dependencies**:
   ```bash
   cd Backend
   dotnet restore
   ```

4. **Set up the database**:
   - Create a new database in MSSQL.
   - Update the connection string in `appsettings.json` in the Backend project.
   - Run the SQL scripts in `DatabaseScripts` to set up the schema and seed data.

5. **Run the application**:
   - **Frontend**:
     ```bash
     cd Frontend
     ng serve
     ```
   - **Backend**:
     ```bash
     cd Backend
     dotnet run
     ```

6. **Access the application**:
   Open your browser and navigate to `http://localhost:4200`.

## Usage

- **Home Page**: Welcome page with a button to explore the About section.
- **About Page**: Information about the Hogwarts Library.
- **Services Page**: Options to rent or buy books. Clicking on these buttons allows users to enter book details and complete the transaction.
- **Contact Page**: Contact details of the library.
- **Member List**: View and manage library members.
- **Book List**: View and manage library books.

## API Endpoints

### Books
- **GET** `/api/books` - Retrieve a list of all books.
- **POST** `/api/books` - Add a new book.
- **PUT** `/api/books/{id}` - Update an existing book.
- **DELETE** `/api/books/{id}` - Delete a book.

### Members
- **GET** `/api/members` - Retrieve a list of all members.
- **POST** `/api/members` - Add a new member.
- **PUT** `/api/members/{id}` - Update an existing member.
- **DELETE** `/api/members/{id}` - Delete a member.

## Database Schema

### Author Table
- **author_name** (PK) - Name of the author.

### Book Table
- **book_id** (PK) - Unique identifier for the book.
- **title** - Title of the book.
- **author_name** (FK) - Author of the book.
- **edition** - Edition of the book.
- **published_year** - Year the book was published.

### Member Table
- **member_id** (PK) - Unique identifier for the member.
- **name** - Name of the member.
- **dob** - Date of birth of the member.
- **gender** - Gender of the member.
- **address** - Address of the member.
- **phone** - Phone number of the member.
- **email** - Email address of the member.
