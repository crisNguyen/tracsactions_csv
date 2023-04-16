class ExportTransactionsController < ApplicationController
  # before_action :validate_params

  def index
    transactions = TransactionsService.new(params[:symbol], params[:date]).perform

    render json: { success: false, status: 422, message: 'Data not found' } and return if transactions.blank?

    respond_to do |format|
      transaction_csv = ExportCsvTransactionService.new(transactions, Transaction::CSV_ATTRIBUTES)
      format.csv { send_data transaction_csv.perform, filename: 'transactions.csv', type: :csv }
    end
  end

  private

  def validate_params
    params_export = ValidateExportTransaction::ExportTransaction.new(params)
    return if params_export.valid?

    render json: { error: params_export.errors, status: 422 } and return
  end
end