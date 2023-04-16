require "csv"

class ExportCsvTransactionService
  def initialize(objects, attributes)
    @attributes = attributes
    @objects = objects
    @header = attributes.map { |attr| I18n.t("header_csv.#{attr}") }
  end

  def perform
    CSV.generate do |csv|
      csv << header
      row = []
      objects.each do |object|
        row << object.created_at.to_i
        row << object.transaction_type
        row << object.symbol.to_sym
        row << object.amount
        row << object.portfolio
      end
      csv << row
    end
  end

  private

  attr_reader :attributes, :objects, :header
end
