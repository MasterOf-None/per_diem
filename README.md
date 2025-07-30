# PER_DIEM

Comprehensive Viaticum Management System

![Last Commit](https://img.shields.io/github/last-commit/MasterOf-None/per_diem)
![Top Language](https://img.shields.io/github/languages/top/MasterOf-None/per_diem)
![Languages Count](https://img.shields.io/github/languages/count/MasterOf-None/per_diem)

## Table of Contents
- [PER\_DIEM](#per_diem)
  - [Table of Contents](#table-of-contents)
  - [Overview](#overview)
  - [Features](#features)
  - [Architecture](#architecture)
    - [Project Routes](#project-routes)
  - [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
    - [Database Setup](#database-setup)
    - [Running the Application](#running-the-application)
  - [Usage](#usage)
  - [Project Structure](#project-structure)
  - [Technologies Used](#technologies-used)

## Overview

**per_diem** is a powerful tool designed to simplify the complexities of travel expense management, providing a comprehensive solution for managing the viaticum process efficiently. It streamlines the management of travel expenses and commission orders, ensuring a seamless experience for users.

## Features

- **Comprehensive Viaticum Management:** Streamlines the management of travel expenses and commission orders.
- **Modular Architecture:** Promotes scalability and maintainability through a well-structured codebase.
- **User-friendly Interface:** Simplifies user interactions with intuitive forms for expense submissions.
- **Robust Database Integration:** Efficiently manages data operations with MySQL.
- **Dynamic Content Rendering:** Utilizes Handlebars for seamless integration of data presentation.

## Architecture

The project follows a modular structure using Express.js for the backend, Handlebars for templating, and MySQL for data storage. The codebase is organized for scalability and maintainability, with clear separation of concerns between routes, views, and database logic.

### Project Routes

- index
- commissionorder
- selectedpath
- others
- lodging
- food
- taxi
- fuel
- toolbooth

## Getting Started

### Prerequisites
- [Node.js](https://nodejs.org) (v12 or higher recommended)
- [npm](https://www.npmjs.com)
- [MySQL](https://www.mysql.com)

### Installation

1. **Clone the repository:**
   ```sh
   git clone https://github.com/MasterOf-None/per_diem.git
   cd per_diem
   ```
2. **Install dependencies:**
   ```sh
   npm install
   ```

### Database Setup

1. Create a MySQL database named `viaticos`.
2. Import the schema from `database/viaticos.sql`:
   ```sh
   mysql -u <user> -p < database/viaticos.sql
   ```
3. Update the database credentials in `src/keys.js` if needed:
   ```js
   module.exports = {
     database: {
       host: "localhost",
       user: "per_diem_user",
       password: "",
       database: "viaticos"
     }
   };
   ```

### Running the Application

- **Development mode (with auto-reload):**
  ```sh
  npm run dev
  ```
- **Production mode:**
  ```sh
  npm start
  ```

The server will start on [http://localhost:3000](http://localhost:3000) by default.

## Usage

- Access the main page to log in.
- Submit commission orders, select travel routes, and manage viaticum expenses through the provided forms.
- The application guides users through a step-by-step process for entering commission and travel details.

## Project Structure

```
per_diem/
├── database/
│   └── viaticos.sql           # MySQL schema
├── src/
│   ├── database.js            # Database connection pool
│   ├── index.js               # Main Express app
│   ├── keys.js                # DB credentials
│   ├── lib/                   # Utility modules
│   ├── public/                # Static assets (CSS, icons)
│   ├── routes/                # Express route handlers
│   └── views/                 # Handlebars templates
├── package.json
└── README.md
```

## Technologies Used

- **Node.js** / **Express.js** — Backend server
- **MySQL** — Relational database
- **express-handlebars** — Templating engine
- **Morgan** — HTTP request logger
- **Nodemon** — Development auto-reloader
- **ESLint** — Linting and code quality
- **jsPDF** — PDF generation (for reports)

<!-- ## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements or bug fixes.

## License

This project is licensed under the ISC License. See the [LICENSE](LICENSE) file for details. -->
