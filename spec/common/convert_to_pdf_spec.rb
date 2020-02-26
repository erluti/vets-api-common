# frozen_string_literal: true

require 'spec_helper'

describe Common::ConvertToPdf, uploader_helpers: true do
  stub_virus_scan

  def uploaded_file(path, content_type)
    file = File.open(path)
    file.instance_variable_set(:@the_file_type, content_type)
    def file.content_type
      @the_file_type
    end
    file
  end

  let(:file) { uploaded_file('spec/fixtures/evss_claim/converted_image.TIF.jpg', 'image/jpeg') }

  let(:instance) do
    described_class.new(file)
  end

  describe '#run' do
    def test_converted_to_pdf
      file_path = instance.run
      expect(MimeMagic.by_magic(File.read(file_path)).type).to eq(
        'application/pdf'
      )
      File.delete(file_path)
    end

    context 'with an image' do
      it 'converts an image to pdf format' do
        test_converted_to_pdf
      end
    end

    context 'when an image is not what it seems' do
      it 'raise an IOError' do
        allow(file).to receive(:content_type).and_return('text/plain')
        expect { instance.run }.to raise_error IOError, 'PDF conversion failed, unsupported file type: text/plain'
      end
    end

    context 'with a pdf file' do
      let(:file) { uploaded_file('spec/fixtures/pdf_fill/extras.pdf','application/pdf') }

      it 'stills be pdf and not run convert' do
        expect(MiniMagick::Tool::Convert).not_to receive(:new)
        test_converted_to_pdf
      end
    end
  end
end
