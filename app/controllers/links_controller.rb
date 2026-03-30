class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      # Redireciona usando a nova propriedade url_short
      redirect_to info_link_path(@link.url_short), notice: 'URL encurtada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def info
    # Busca no banco de dados pela coluna url_short
    @link = Link.find_by!(url_short: params[:url_short])
  end

  def redirect
    
    @link = Link.find_by!(url_short: params[:url_short])
    
    @link.increment!(:clicks_count)
      
    redirect_to @link.url_original, allow_other_host: true
  end

  private

  def link_params
    # Permite apenas o envio da url_original pelo formulário
    params.require(:link).permit(:url_original)
  end
end