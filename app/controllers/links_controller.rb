# app/controllers/links_controller.rb
class LinksController < ApplicationController
  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      # Redireciona usando a nova propriedade short_url
      redirect_to info_link_path(@link.short_url), notice: 'URL encurtada com sucesso!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def info
    # Busca no banco de dados pela coluna short_url
    @link = Link.find_by!(short_url: params[:short_url])
  end

  def redirect
    # Busca pela short_url
    @link = Link.find_by!(short_url: params[:short_url])
    
    # Incrementa a nova coluna click_count
    @link.increment!(:click_count)
    
    redirect_to @link.original_url, allow_other_host: true
  end

  private
  def link_params
    params.require(:link).permit(:original_url)
  end
end