module Api
    class TicketsController < ApplicationController

      def index
      end

      def create
        amount_of_tickets = params[:amount].to_i
        amount_of_tickets.times do
          ticket = Ticket.new
          # event_id = params[:event_id]
          # user_id = params[:user_id]
          # hard code first, after finish login and schedule part, then pass these params.
          ticket.event_id = Event.first.id
          ticket.user_id = User.first.id
          ticket.save
        end
        # hard code to index page first, after finish the home page change to homepage
        render :index

      end

      def show
        user_id = params[:id]
        @tickets = Ticket.where(user_id: user_id);
        render json: @tickets.to_json
        # should render to user's profile page which we don't have yet, hard code to show page
      end
    end
end
