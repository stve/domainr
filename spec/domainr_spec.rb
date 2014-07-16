RSpec.describe Domainr do

  describe '#search' do
    context "with a search term" do
      subject { Domainr.search('domainr') }

      it "includes the query term" do
        expect(subject.query).to eq('domainr')
      end

      it "returns results" do
        expect(subject.results.size).to eq(16)

        first_result = subject.results.first
        expect(first_result.domain).to eq('domainr.com')
        expect(first_result.availability).to eq('maybe')

        second_result = subject.results[1]
        expect(second_result.domain).to eq('domainr.net')
        expect(second_result.availability).to eq('maybe')
      end
    end

    context "without a search term" do
      subject { Domainr.search(nil) }

      it "returns an error" do
        expect(subject.results.size).to eq(0)
        expect(subject.error).to be
        expect(subject.error.status).to eq(404)
        expect(subject.error.message).to eq('No results found.')
      end
    end
  end

  context "Retrieving info from Domainr" do
    context "with a valid search term"do
      subject { Domainr.info('domai.nr') }

      it "return results" do
        expect(subject.registrars)
        expect(subject.domain).to eq('domai.nr')
        expect(subject.availability).to eq('taken')
        expect(subject.tld.domain).to eq('nr')
      end
    end

    context "with an invalid search term" do
      subject { Domainr.info('d') }

      it "returns an error" do
        expect(subject.error).to be
        expect(subject.error.status).to eq(404)
        expect(subject.error.message).to eq('No results found.')
      end
    end
  end
end
