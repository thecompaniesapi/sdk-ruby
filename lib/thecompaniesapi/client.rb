# frozen_string_literal: true

require_relative 'http_client'

module TheCompaniesAPI
  ##
  # The Companies API client with auto-generated methods
  #
  # This class extends HttpClient with auto-generated methods
  # from the OpenAPI specification.
  class Client < HttpClient
      ##
      # 
      #
      # Get the health status of the API.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_api_health(params: {}, headers: {})
              endpoint = '/'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get the current OpenAPI specification.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_open_api(params: {}, headers: {})
              endpoint = '/v2/openapi'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get and filter your actions.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_actions(params: {}, headers: {})
              endpoint = '/v2/actions'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Request or estimate a new action.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def request_action(data: {}, headers: {})
              endpoint = '/v2/actions'
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Ask for a retry of failed action.
      #
      # @param action_id [String] Path parameter
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def retry_action(action_id, data: {}, headers: {})
              endpoint = "/v2/actions/#{action_id}/retry"
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Search companies using a segmentation query.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_companies(params: {}, headers: {})
              endpoint = '/v2/companies'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search companies using a segmentation query.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_companies_post(data: {}, headers: {})
              endpoint = '/v2/companies'
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Get a single company data by its domain.
      #
      # @param domain [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_company(domain, params: {}, headers: {})
              endpoint = "/v2/companies/#{domain}"
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search companies by name.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_companies_by_name(params: {}, headers: {})
              endpoint = '/v2/companies/by-name'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search companies by prompt.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_companies_by_prompt(params: {}, headers: {})
              endpoint = '/v2/companies/by-prompt'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get similar companies from one or many domains.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_similar_companies(params: {}, headers: {})
              endpoint = '/v2/companies/similar'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get the count of companies using a segmentation query.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def count_companies(params: {}, headers: {})
              endpoint = '/v2/companies/count'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get the count of companies using a segmentation body.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def count_companies_post(data: {}, headers: {})
              endpoint = '/v2/companies/count'
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Get a company data by email.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_company_by_email(params: {}, headers: {})
              endpoint = '/v2/companies/by-email'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get a company data by social media.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_company_by_social(params: {}, headers: {})
              endpoint = '/v2/companies/by-social'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get email patterns for a company by its domain.
      #
      # @param domain [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_company_email_patterns(domain, params: {}, headers: {})
              endpoint = "/v2/companies/#{domain}/email-patterns"
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Ask a question about a company by its domain.
      #
      # @param domain [String] Path parameter
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def ask_company(domain, data: {}, headers: {})
              endpoint = "/v2/companies/#{domain}/ask"
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Get the full context of a company by its domain.
      #
      # @param domain [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_company_context(domain, params: {}, headers: {})
              endpoint = "/v2/companies/#{domain}/context"
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Fetch analytics data for search segmentations and lists.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_companies_analytics(params: {}, headers: {})
              endpoint = '/v2/companies/analytics'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Export analytics data for search segmentations and lists.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def export_companies_analytics(data: {}, headers: {})
              endpoint = '/v2/companies/analytics/export'
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Search industries.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_industries(params: {}, headers: {})
              endpoint = '/v2/industries'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get similar industries from one or many industries.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_industries_similar(params: {}, headers: {})
              endpoint = '/v2/industries/similar'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search technologies.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_technologies(params: {}, headers: {})
              endpoint = '/v2/technologies'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search cities.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_cities(params: {}, headers: {})
              endpoint = '/v2/locations/cities'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search counties.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_counties(params: {}, headers: {})
              endpoint = '/v2/locations/counties'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search countries.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_countries(params: {}, headers: {})
              endpoint = '/v2/locations/countries'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search states.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_states(params: {}, headers: {})
              endpoint = '/v2/locations/states'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Search continents.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def search_continents(params: {}, headers: {})
              endpoint = '/v2/locations/continents'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Enrich job titles.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def enrich_job_titles(params: {}, headers: {})
              endpoint = '/v2/job-titles/enrich'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get and filter your lists.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_lists(params: {}, headers: {})
              endpoint = '/v2/lists'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Create a new list.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def create_list(data: {}, headers: {})
              endpoint = '/v2/lists'
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Update a list.
      #
      # @param list_id [String] Path parameter
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def update_list(list_id, data: {}, headers: {})
              endpoint = "/v2/lists/#{list_id}"
      
              patch(endpoint, body: data)
      end

      ##
      # 
      #
      # Delete a list.
      #
      # @param list_id [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def delete_list(list_id, params: {}, headers: {})
              endpoint = "/v2/lists/#{list_id}"
      
              delete(endpoint, params: params)
      end

      ##
      # 
      #
      # Get companies in a list with a segmentation query.
      #
      # @param list_id [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_companies_in_list(list_id, params: {}, headers: {})
              endpoint = "/v2/lists/#{list_id}/companies"
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Get companies in a list with a segmentation body.
      #
      # @param list_id [String] Path parameter
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_companies_in_list_post(list_id, data: {}, headers: {})
              endpoint = "/v2/lists/#{list_id}/companies"
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Get a company in a list.
      #
      # @param list_id [String] Path parameter
      # @param domain [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_company_in_list(list_id, domain, params: {}, headers: {})
              endpoint = "/v2/lists/#{list_id}/companies/#{domain}"
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Toggle one or more companies in a list.
      #
      # @param list_id [String] Path parameter
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def toggle_companies_in_list(list_id, data: {}, headers: {})
              endpoint = "/v2/lists/#{list_id}/companies/toggle"
      
              patch(endpoint, body: data)
      end

      ##
      # 
      #
      # Get team information.
      #
      # @param team_id [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_team(team_id, params: {}, headers: {})
              endpoint = "/v2/teams/#{team_id}"
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Update a team.
      #
      # @param team_id [String] Path parameter
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def update_team(team_id, data: {}, headers: {})
              endpoint = "/v2/teams/#{team_id}"
      
              patch(endpoint, body: data)
      end

      ##
      # 
      #
      # Get current user information.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_user(params: {}, headers: {})
              endpoint = '/v2/user'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Fetch prompts history.
      #
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def fetch_prompts(params: {}, headers: {})
              endpoint = '/v2/prompts'
      
              get(endpoint, params: params)
      end

      ##
      # 
      #
      # Delete a prompt.
      #
      # @param prompt_id [String] Path parameter
      # @param params [Hash] Query parameters
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def delete_prompt(prompt_id, params: {}, headers: {})
              endpoint = "/v2/prompts/#{prompt_id}"
      
              delete(endpoint, params: params)
      end

      ##
      # 
      #
      # Query the product prompt.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def product_prompt(data: {}, headers: {})
              endpoint = '/v2/prompts/product'
      
              post(endpoint, body: data)
      end

      ##
      # 
      #
      # Convert a query to a segmentation.
      #
      # @param data [Hash] Request body data
      # @param headers [Hash] Additional headers
      # @return [Hash] API response
      def prompt_to_segmentation(data: {}, headers: {})
              endpoint = '/v2/prompts/segmentation'
      
              post(endpoint, body: data)
      end
  end
end
