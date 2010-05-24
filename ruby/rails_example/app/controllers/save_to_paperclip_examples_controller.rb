class SaveToPaperclipExamplesController < ApplicationController

  def index
    @save_to_paperclip_examples = SaveToPaperclipExample.all
    
    respond_to do |format|
      format.html
      format.xls { send_data Doc.create(:name => "example", :document_content => render_to_string) }
    end
  end
  
  def new
    @save_to_paperclip_example = SaveToPaperclipExample.new
  end

  def create
    @save_to_paperclip_example = SaveToPaperclipExample.new(params[:save_to_paperclip_example])

    if @save_to_paperclip_example.save
      flash[:notice] = 'Example was successfully created.'
      redirect_to save_to_paperclip_examples_url
    else
      render :action => "new"
    end
  end

  def destroy
    @save_to_paperclip_example = SaveToPaperclipExample.find(params[:id])
    @save_to_paperclip_example.destroy
  
    redirect_to save_to_paperclip_examples_url
  end
  
end