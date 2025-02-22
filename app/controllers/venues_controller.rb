class VenuesController < ApplicationController

  def index
    @list_of_venues = Venue.all.order({ :created_at => :desc })

    render({ :template => "venue_templates/venue_list" })
  end

  def show
    venue_id = params.fetch("path_id")
    @the_venue = Venue.find(venue_id)

    if @the_venue.id == nil
      redirect_to("/venues")
    else
      render({ :template => "venue_templates/details" })
    end
  end

  def create
    @venue = Venue.new
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    
    if @venue.valid?
      @venue.save
      redirect_to("/venues/#{@venue.id}", {:notice => "Venue created successfully"})
    else
      redirect_to("/venues", {:notice => "Venue failed to create"})
    end

  end
  
  def update
    the_id = params.fetch("the_id")
    @venue = Venue.find(the_id)
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    
    if @venue.valid?
      @venue.save
      redirect_to("/venues/#{@venue.id}", {:notice => "Venue created successfully"})
    else
      redirect_to("/venues#{@venue.id}", {:notice => "Venue failed to create"})
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    @the_venue = Venue.find(the_id)

    @the_venue.destroy  

    redirect_to("/venues", { :notice => "Venue deleted successfully" })
  end

  def add_comment
    @the_comment = Comment.new
    @the_comment.venue_id = params.fetch("query_venue_id")
    @the_comment.author_id = params.fetch("query_author_id")
    @the_comment.body = params.fetch("query_body")

    if @the_comment.valid?
      @the_comment.save
      redirect_to("/venues/#{@the_comment.venue_id}", { :notice => "Comment created successfully," })
    else
      redirect_to("/venues/#{@the_comment.venue_id}", { :notice => "Comment failed to created successfully," })
    end
  end

end
