# The Companies API SDK for Ruby

[![Gem Version][gem-version-src]][gem-version-href]
[![Gem Downloads][gem-downloads-src]][gem-downloads-href]
[![License][license-src]][license-href]

A fully-featured Ruby SDK for [The Companies API](https://www.thecompaniesapi.com), providing type-safe access to company data, locations, industries, technologies, job titles, lists, and more.

If you need more details about a specific endpoint, you can find the corresponding documentation in [the API reference](https://www.thecompaniesapi.com/api).

You can also contact us on our [livechat](https://www.thecompaniesapi.com/) if you have any questions.

## 🚀 Features

- Expose all our 30+ endpoints and gives access to 50M+ companies from your codebase
- Type-safe API client with full access to our [OpenAPI](https://api.thecompaniesapi.com/v2/openapi) schemas
- Real-time company enrichment with both synchronous and asynchronous options
- Powerful search capabilities with filters, sorting and pagination
- Create and manage your company lists
- Track and monitor enrichment actions and requests
- Generate detailed analytics and insights for searches and lists
- Natural language querying for structured company information
- Lightweight with minimal dependencies

## 📦 Installation

Add this line to your application's Gemfile:

```ruby
gem 'thecompaniesapi'
```

And then execute:

```bash
bundle install
```

Or install it yourself as:

```bash
gem install thecompaniesapi
```

## 🔑 Initialize the client

Get your API token from [your settings page](https://www.thecompaniesapi.com/settings/api-tokens) and initialize our client with `TheCompaniesAPI::Client.new`.

The API token is required to authenticate your requests and should be kept secure. Never commit your API token to version control or share it publicly.

```ruby
require 'thecompaniesapi'

tca = TheCompaniesAPI::Client.new(api_token: 'your-api-token')
```

## 🏬 Companies

### Search companies

📖 [Documentation](https://www.thecompaniesapi.com/api/search-companies)

🕹️ [Use case: How to build a company search engine with our API](https://www.thecompaniesapi.com/use-cases/companies-search-engine)

🔍 To learn more about our query system, please read our [documentation](https://www.thecompaniesapi.com/use-cases/companies-search-engine).

```ruby
# Search companies by industry and size
response = tca.search_companies(
  query: [
    { attribute: 'about.industries', operator: 'or', sign: 'equals', values: ['computer-software'] },
    { attribute: 'about.totalEmployees', operator: 'or', sign: 'equals', values: ['10-50'] }
  ],
  size: 25
)

companies = response['companies'] # Companies that match the query
meta = response['meta'] # Meta information
```

### Search companies by name

📖 [Documentation](https://www.thecompaniesapi.com/api/search-companies-name)

🕹️ [Use case: Add a company search with autocomplete to your application](https://www.thecompaniesapi.com/use-cases/company-autocomplete)

```ruby
response = tca.search_companies_by_name(
  name: 'The Companies API',
  size: 2
)

companies = response['companies'] # Companies that match the name
meta = response['meta'] # Meta information
```

### Search companies using a prompt

📖 [Documentation](https://www.thecompaniesapi.com/api/search-companies-prompt)

```ruby
# Search 25 companies for a specific prompt
response = tca.search_companies_by_prompt(
  prompt: 'SaaS Companies in the United States with more than 100 employees',
  size: 25
)

companies = response['companies'] # Companies that match the prompt
meta = response['meta'] # Meta information
```

### Search similar companies

📖 [Documentation](https://www.thecompaniesapi.com/api/search-similar-companies)

```ruby
# Search 25 companies that are similar to Crisp and Intercom
response = tca.search_similar_companies(
  domains: ['crisp.chat', 'intercom.com'],
  size: 25
)

companies = response['companies'] # Companies that are similar to the domains
meta = response['meta'] # Meta information
```

### Count companies matching your query

📖 [Documentation](https://www.thecompaniesapi.com/api/count-companies)

```ruby
# Count how many companies are in the computer-software industry
response = tca.count_companies(
  query: [
    {
      attribute: 'about.industries',
      operator: 'or',
      sign: 'equals',
      values: ['computer-software']
    }
  ]
)

count = response # Number of companies that match the query
```

### Enrich a company from a domain name

📖 [Documentation](https://www.thecompaniesapi.com/api/enrich-company-from-domain)

```ruby
# Fetch company data from our database without enrichment (faster response)
response = tca.fetch_company(domain: 'microsoft.com')

company = response # The company profile

# Fetch company data and re-analyze it in real-time to get fresh, up-to-date information (slower but more accurate)
response = tca.fetch_company(
  domain: 'microsoft.com',
  refresh: true
)

company = response # The company profile
```

### Enrich a company from an email

📖 [Documentation](https://www.thecompaniesapi.com/api/enrich-company-from-email)

🕹️ [Use case: Enrich your users at signup with the latest information about their company](https://www.thecompaniesapi.com/use-cases/enrich-users-signup)

```ruby
# Fetch the company profile behind a professional email address
response = tca.fetch_company_by_email(email: 'jack@openai.com')

company = response # The company profile
```

### Enrich a company from a social network URL

📖 [Documentation](https://www.thecompaniesapi.com/api/enrich-company-from-social-network-url)

```ruby
# Fetch the company profile behind a social network URL
response = tca.fetch_company_by_social(linkedin: 'https://www.linkedin.com/company/apple')

company = response # The company profile
```

### Find a company email patterns

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-company-email-patterns)

```ruby
# Fetch the company email patterns for a specific domain
response = tca.fetch_company_email_patterns(domain: 'apple.com')

patterns = response # The company email patterns
```

### Ask a question about a company

📖 [Documentation](https://www.thecompaniesapi.com/api/ask-company)

```ruby
# Ask what products a company offers using its domain
response = tca.ask_company(
  domain: 'microsoft.com',
  question: 'What products does this company offer?',
  model: 'large', # 'small' is also available
  fields: [
    {
      key: 'products',
      type: 'array|string',
      description: 'The products that the company offers'
    }
  ]
)

answer = response['answer'] # Structured AI response
meta = response['meta'] # Meta information
```

### Fetch the context of a company

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-company-context)

```ruby
# Get AI-generated strategic insights about a company
response = tca.fetch_company_context(domain: 'microsoft.com')

context = response['context'] # Includes market, model, differentiators, etc.
meta = response['meta'] # Meta information
```

### Fetch analytics data for a query or your lists

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-companies-analytics)

```ruby
# Analyze company distribution by business type
response = tca.fetch_companies_analytics(
  attribute: 'about.businessType',
  query: [
    {
      attribute: 'locations.headquarters.country.code',
      operator: 'or',
      sign: 'equals',
      values: ['us', 'gb', 'fr']
    }
  ]
)

analytics = response['data'] # Aggregated values
meta = response['meta'] # Meta information
```

### Export analytics data in multiple formats for a search

📖 [Documentation](https://www.thecompaniesapi.com/api/export-companies-analytics)

```ruby
# Export analytics to CSV
response = tca.export_companies_analytics(
  format: 'csv',
  attributes: ['about.industries', 'about.totalEmployees'],
  query: [
    {
      attribute: 'technologies.active',
      operator: 'or',
      sign: 'equals',
      values: ['shopify']
    }
  ]
)

analytics = response['data'] # Aggregated values
meta = response['meta'] # Meta information
```

## 🎯 Actions

### Request an action on one or more companies

📖 [Documentation](https://www.thecompaniesapi.com/api/request-action)

```ruby
# Request an enrichment job on multiple companies
response = tca.request_action(
  domains: ['microsoft.com', 'apple.com'],
  job: 'enrich-companies',
  estimate: false
)

actions = response['actions'] # Track this via fetch_actions
meta = response['meta'] # Meta information
```

### Fetch the actions for your actions

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-actions)

```ruby
# Fetch recent actions
response = tca.fetch_actions(
  status: 'completed',
  page: 1,
  size: 5
)

actions = response['actions'] # Actions that match the query
meta = response['meta'] # Meta information
```

## 🏭 Industries

### Search industries

📖 [Documentation](https://www.thecompaniesapi.com/api/search-industries)

```ruby
# Search industries by keyword
response = tca.search_industries(
  search: 'software',
  size: 10
)

industries = response['industries'] # Industries that match the keyword
meta = response['meta'] # Meta information
```

### Find similar industries

📖 [Documentation](https://www.thecompaniesapi.com/api/find-similar-industries)

```ruby
# Find industries similar to given ones
response = tca.search_industries_similar(industries: ['saas', 'fintech'])

similar = response['industries'] # Industries that are similar to the given ones
meta = response['meta'] # Meta information
```

## ⚛️ Technologies

### Search technologies

📖 [Documentation](https://www.thecompaniesapi.com/api/search-technologies)

```ruby
# Search technologies by keyword
response = tca.search_technologies(
  search: 'shopify',
  size: 10
)

technologies = response['technologies'] # Technologies that match the keyword
meta = response['meta'] # Meta information
```

## 🌍 Locations

### Search cities

📖 [Documentation](https://www.thecompaniesapi.com/api/search-cities)

```ruby
# Search cities by name
response = tca.search_cities(
  search: 'new york',
  size: 5
)

cities = response['cities'] # Cities that match the name
meta = response['meta'] # Meta information
```

### Search counties

📖 [Documentation](https://www.thecompaniesapi.com/api/search-counties)

```ruby
# Search counties by name
response = tca.search_counties(
  search: 'orange',
  size: 5
)

counties = response['counties'] # Counties that match the name
meta = response['meta'] # Meta information
```

### Search states

📖 [Documentation](https://www.thecompaniesapi.com/api/search-states)

```ruby
# Search states by name
response = tca.search_states(
  search: 'california',
  size: 5
)

states = response['states'] # States that match the name
meta = response['meta'] # Meta information
```

### Search countries

📖 [Documentation](https://www.thecompaniesapi.com/api/search-countries)

```ruby
# Search countries by name
response = tca.search_countries(
  search: 'france',
  size: 5
)

countries = response['countries'] # Countries that match the name
meta = response['meta'] # Meta information
```

### Search continents

📖 [Documentation](https://www.thecompaniesapi.com/api/search-continents)

```ruby
# Search continents by name
response = tca.search_continents(
  search: 'asia',
  size: 5
)

continents = response['continents'] # Continents that match the name
meta = response['meta'] # Meta information
```

## 💼 Job titles

### Enrich a job title from its name

📖 [Documentation](https://www.thecompaniesapi.com/api/enrich-job-title-from-name)

```ruby
# Enrich "chief marketing officer"
response = tca.enrich_job_titles(name: 'chief marketing officer')

job_title = response # Contains department, seniority, etc.
```

## 📋 Lists

### Fetch your lists

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-lists)

```ruby
# Fetch your lists
response = tca.fetch_lists

lists = response['lists'] # Lists that match the query
meta = response['meta'] # Meta information
```

### Create a list of companies

📖 [Documentation](https://www.thecompaniesapi.com/api/create-list)

```ruby
# Create a list of companies
response = tca.create_list(
  name: 'My SaaS List',
  type: 'companies'
)

new_list = response # The new list
```

### Fetch companies in your list

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-companies-in-list)

```ruby
# Fetch companies in a list
response = tca.fetch_companies_in_list(list_id: 1234)

companies = response['companies'] # Companies that match the list
meta = response['meta'] # Meta information
```

### Add or remove companies in your list

📖 [Documentation](https://www.thecompaniesapi.com/api/toggle-companies-in-list)

```ruby
# Add companies to a list
response = tca.toggle_companies_in_list(
  list_id: 1234,
  companies: ['apple.com', 'stripe.com']
)

list = response # The updated list
```

## 👥 Teams

### Fetch your team

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-team)

```ruby
# Fetch your team details
response = tca.fetch_team

team = response # Your team details
```

## 🔧 Utilities

### Fetch the health of the API

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-api-health)

```ruby
# Check API health status
response = tca.fetch_api_health

health = response # The health of the API
```

### Fetch the OpenAPI schema

📖 [Documentation](https://www.thecompaniesapi.com/api/fetch-openapi)

```ruby
# Fetch OpenAPI schema
response = tca.fetch_open_api

schema = response # The OpenAPI schema
```

## License

[MIT](./LICENSE) License © [TheCompaniesAPI](https://github.com/thecompaniesapi)

[gem-version-src]: https://img.shields.io/gem/v/thecompaniesapi?style=flat&colorA=080f12&colorB=1fa669
[gem-version-href]: https://rubygems.org/gems/thecompaniesapi
[gem-downloads-src]: https://img.shields.io/gem/dm/thecompaniesapi?style=flat&colorA=080f12&colorB=1fa669
[gem-downloads-href]: https://rubygems.org/gems/thecompaniesapi
[license-src]: https://img.shields.io/github/license/thecompaniesapi/sdk-ruby.svg?style=flat&colorA=080f12&colorB=1fa669
[license-href]: https://github.com/thecompaniesapi/sdk-ruby/blob/main/LICENSE
