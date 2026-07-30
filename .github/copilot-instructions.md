# GitHub Copilot Instructions for IntegrationHub

## Project Overview

IntegrationHub is Cien.ai's repository for customer integration resources, providing Power BI reports, datasets, and deployment scripts for the GTM (Go-to-Market) Suite. This repository serves as a central hub for customers to download and deploy Cien.ai's analytics solutions.

## Purpose

This repository provides:
- Power BI reports and datasets for GTM Suite analytics
- Deployment scripts for Power BI workspace management
- Salesforce data synchronization scripts
- ETL resources (dbt and Fivetran integration guides)

## Technology Stack

- **Power BI**: `.pbix` files (compiled) and `.pbip` files (Power BI Project format for version control)
- **PowerShell**: Deployment and automation scripts (v7+ required)
- **GitHub Actions**: CI/CD for building PBIX files from PBIP projects
- **dbt**: Data transformation framework
- **Fivetran**: Data integration platform
- **pbi-tools**: Command-line tool for converting PBIP to PBIX

## Repository Structure

```
/
├── .github/
│   └── workflows/
│       └── publish_pbi.yaml      # CI/CD workflow for PBIP to PBIX conversion
├── powerbi/
│   ├── *.pbix                     # Compiled Power BI reports and datasets
│   ├── src/                       # Power BI Project (.pbip) source files
│   └── README.md                  # Deployment instructions
├── scripts/
│   ├── pbi_deploy/                # Power BI deployment automation
│   │   ├── pbi_deploy.ps1         # PowerShell deployment script
│   │   ├── pbi_cfg.json           # Configuration for deployments
│   │   └── README.md
│   └── sf_file_sync/              # Salesforce data synchronization
│       ├── salesforce_file_sync_scripts.ps1
│       ├── anonymize.ps1          # PII masking script
│       ├── config.json
│       └── README.md
├── ETL/
│   ├── dbt/                       # dbt resources and documentation
│   └── fivetran/                  # Fivetran resources and documentation
└── doc/
    └── Cien.ai_API_Documentation.pdf
```

## Development Workflow

### Power BI Development

1. **Source Control**: Power BI files are stored in `.pbip` format in `/powerbi/src/` for version control
2. **Build Process**: GitHub Actions workflow automatically converts `.pbip` to `.pbix` on push/PR
3. **Artifacts**: Compiled `.pbix` files are stored as artifacts and in `/powerbi/` directory

### PowerShell Scripts

1. **Version**: All PowerShell scripts require PowerShell 7+
2. **Security**: Scripts may require execution policy bypass: `Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`
3. **Configuration**: Scripts use JSON configuration files (e.g., `pbi_cfg.json`, `config.json`)
4. **Environment Variables**: Sensitive data like database credentials should use environment variables (e.g., `DBUSER`, `DBPASSWORD`)

### Build and Test

**GitHub Actions Workflow** (`publish_pbi.yaml`):
- Triggers on push/PR to `main` or `staging` branches when `.pbip` files change
- Uses `pbi-tools` (v1.2.0) to compile PBIP projects to PBIX
- Caches `pbi-tools` for faster builds
- Uploads artifacts with 30-day retention
- Publishes to GitHub Packages on successful merge to main

**Manual Testing**:
- Power BI reports can be tested by opening in Power BI Desktop
- PowerShell scripts should be tested on Windows and macOS/Linux where applicable

## Coding Standards

### PowerShell

- Use clear variable names with appropriate prefixes (e.g., `$source_workspace`)
- Include inline comments for complex logic
- Validate required environment variables before execution
- Use `Write-Host` or `Write-Output` for user-facing messages
- Handle errors gracefully with try-catch blocks

### Configuration Files

- Use JSON format for configuration files
- Include descriptive keys and comments where appropriate
- Validate JSON syntax before committing
- Never commit sensitive data (passwords, tokens, API keys)

### Power BI

- Use `.pbip` format for source control instead of `.pbix`
- Keep datasets and reports separate for better reusability
- Follow naming convention: "GTM Suite - [Component Type] - [Name]"
- Document data source parameters and connection requirements

## Security Best Practices

1. **Never commit secrets**: Use environment variables or secure vaults for credentials
2. **PII Handling**: Use the anonymization scripts in `/scripts/sf_file_sync/` for handling PII
3. **Gitignore**: Exclude sensitive files like `.pbi/localSettings.json` and `.pbi/cache.abf`
4. **Script Security**: Review PowerShell execution policies and run scripts from trusted sources

## Common Tasks

### Adding a New Power BI Report

1. Create the report in Power BI Desktop
2. Save as `.pbip` format in `/powerbi/src/`
3. Commit the `.pbip` directory structure
4. GitHub Actions will automatically build the `.pbix` file
5. Update `/powerbi/README.md` if needed

### Updating Deployment Scripts

1. Modify PowerShell scripts in `/scripts/pbi_deploy/` or `/scripts/sf_file_sync/`
2. Update corresponding `README.md` with any new parameters or steps
3. Test on both Windows and macOS/Linux if script is cross-platform
4. Update configuration examples in JSON files

### Modifying GitHub Actions Workflow

1. Edit `.github/workflows/publish_pbi.yaml`
2. Test workflow on a feature branch first
3. Ensure caching keys are updated if tool versions change
4. Verify artifact upload/download works correctly

## File Types to Exclude

When making changes, exclude these from commits:
- Build artifacts: compiled temporary files
- Dependencies: `node_modules/`, Python virtual environments
- Power BI cache: `.pbi/localSettings.json`, `.pbi/cache.abf`
- OS files: `.DS_Store`
- Sensitive data: credentials, API keys, customer data

## Customer-Facing Documentation

All customer-facing documentation should:
- Be clear and step-by-step
- Include prerequisites and system requirements
- Provide examples for common use cases
- Mention both Windows and macOS/Linux where applicable
- Include troubleshooting tips
- Reference support contact: support@cien.ai

## Integration Points

- **Salesforce**: Scripts sync data from Salesforce.com using sfdx CLI
- **Power BI Service**: Deployment scripts interact with Power BI workspaces via Power BI REST API
- **Azure Data Lake**: Two datasets specifically connect to Azure Data Lake Storage:
  - `Dataset - Azure Data Lake - Automatic Data Enhancement.pbix`: Contains automatic data enhancement metrics and insights
  - `Dataset - Azure Data Lake - Sales Performance.pbix`: Contains sales performance data and analytics
- **Database Servers**: Scripts support both SQL Server and PostgreSQL for data source connections

## Notes for AI Coding Agents

- This is an integration repository primarily for customer use
- Changes should be minimal and carefully tested
- Maintain backward compatibility with existing deployments
- Documentation updates are as important as code changes
- Always verify PowerShell scripts work cross-platform when applicable
- Consider customer impact when modifying configuration file structures
