module ValidateExportTransaction
  class ExportTransaction
    include ActiveModel::Validations

    attr_accessor :date, :symbol

    validates :date, format: { with: /\d{2}\/\d{2}\/\d{4}/, message: 'must be in the format dd/mm/yyyy' }, allow_nil: true

    def initialize(params = {})
      @date = params[:date]
      @symbol = params[:symbol]
    end

  end
end