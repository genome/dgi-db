class InteractionsController < ApplicationController
  def show
    @interaction = DataModel::Interaction.find(params[:id])
    @drug = @interaction.drug
    @gene = @interaction.gene
  end

  def interaction_search_results
    start_time = Time.now
    combine_input_genes(params)
    validate_search_request(params)

    search_results = LookupGenes.find(params)
    @search_results = InteractionSearchResultsPresenter.new(search_results, params, start_time)
    if params[:outputFormat] == 'tsv'
      generate_tsv_headers('interactions_export.tsv')
      render 'interactions_export.tsv', content_type: 'text/tsv', layout: false
    end
  end

  private
  def validate_search_request(params)
    bad_request("You must enter at least one gene name to search!") if params[:gene_names].size == 0
    bad_request("You must upload a plain text formated file") if params[:geneFile] && !validate_file_format('text/plain;', params[:geneFile].tempfile.path)
  end

end
