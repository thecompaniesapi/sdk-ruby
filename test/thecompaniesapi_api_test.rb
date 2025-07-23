require "test_helper"

class TheCompaniesApiTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::TheCompaniesAPI::VERSION
  end
end
