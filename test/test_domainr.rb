require 'helper'

class TestDomainr < Test::Unit::TestCase

  context "Searching Domainr" do
    context "with a search term" do
      setup do
        @domains = Domainr.search('domainr')
      end

      should "include the query term" do
        assert_equal 'domainr', @domains.query
      end

      should "return results" do
        assert_equal @domains.results.size, 16

        first_result = @domains.results.first
        assert_equal first_result.domain, 'domainr.com'
        assert_equal first_result.availability, 'maybe'

        second_result = @domains.results[1]
        assert_equal second_result.domain, 'domainr.net'
        assert_equal second_result.availability, 'maybe'
      end
    end

    context "without a search term" do
      should "return an error" do
        @domains = Domainr.search(nil)
        assert_equal @domains.results.size, 0
        assert @domains.error
        assert_equal @domains.error.status, 404
        assert_equal @domains.error.message, 'No results found.'
      end
    end
  end

  context "Retrieving info from Domainr" do
    context "with a valid search term"do
      should "return results" do
        @domain = Domainr.info('domai.nr')
        assert @domain.registrars
        assert_equal @domain.domain, 'domai.nr'
        assert_equal @domain.availability, 'taken'
        assert_equal @domain.tld.domain, 'nr'
      end
    end

    context "with an invalid search term" do
      should "return an error" do
        @domain = Domainr.info('d')
        assert @domain.error
        assert_equal @domain.error.status, 404
        assert_equal @domain.error.message, 'No results found.'
      end
    end
  end
end
