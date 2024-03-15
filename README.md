# World of Warcraft Character Explorer

## About the Project

This Rails application serves as a comprehensive platform for exploring the vast universe of World of Warcraft (WoW). Users can navigate through different races, classes, and specializations available in WoW, gaining insights into each character's unique attributes and abilities.

## Features

- **Data Visualization**: The application presents a rich dataset involving WoW characters, including races, classes, and their respective specializations.
- **Search and Filter**: Users can perform text searches across the available data or filter their searches within specific categories to find characters that match their interests.
- **Interactive Navigation**: The project implements hierarchical collection navigation, allowing users to explore data by category.
- **Pagination**: Large collections of data are paginated for ease of viewing.
- **Responsive Design**: Crafted with a mobile-first approach, ensuring accessibility across various devices and screen sizes.

## Getting Started

### Prerequisites

- Ruby on Rails 6.0 or higher
- PostgreSQL

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/wow-character-explorer.git
   ```
2. Install dependencies:
   ```bash
   bundle install
   ```
3. Setup the database:
   ```bash
   rails db:create db:migrate db:seed
   ```
4. Start the server:
   ```bash
   rails server
   ```
5. Visit `http://localhost:3000` in your web browser to explore the application.

## Usage

- Navigate through the homepage to explore different WoW characters, including their races, classes, and specializations.
- Use the search feature to find characters by name or filter by category for a more refined search.
- Click on a character to view detailed information, including their lore, abilities, and related media.

## Contributing

Contributions are welcome! Please feel free to submit pull requests or open issues to suggest improvements or add new features.
