# Advent of Code Setup Scripts

This repository contains bash scripts to help set up and manage your Advent of Code projects. (Currently only supports C# projects)

## Features

- **Automated Setup**: Quickly create and initialize new project directories for each day of the Advent of Code challenge.
- **Retrieves input file**: Automatically downloads challenge test input.

## Usage

1. Clone the repository:
    ```bash
    git clone https://github.com/yourusername/aoc_setup.git
    cd aoc_setup
    ```
2. Configure the `.env`: 
    ```.env
    session_cookie=<Your session cookie for Advent of Code>
    location_path=<Directory for your c# solution>
    ```

3. Run the setup script for a specific day:
    ```bash
    ./aoc_setup.sh <day_number>
    ```


## Requirements

- Bash
- Git
- Wget

## Contributing

Contributions are welcome! Please fork the repository and submit a pull request.

## License

This project is licensed under the MIT License.

## Contact

For any questions or suggestions, please open an issue or contact [elijahr0001@gmail.com](elijahr0001@gmail.com).
