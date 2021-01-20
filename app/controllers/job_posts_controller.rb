class JobPostsController < ApplicationController
    before_action :find_job_post,only:[:show,:update, :destroy]
    def new
        @job_post=JobPost.new
    end
    def create
        @job_post=JobPost.new params.require(:job_post)
        .permit(
            :title,
            :description,
            :min_salary,
            :max_salary,
            :company_name,
            :location)
        if @job_post.save
            redirect_to job_post_path(@job_post)
        else
            render :new
        end
    end
    def show
        
    end
    def index
        @job_posts=JobPost.all.order(created_at: :desc)
    end
    def edit
    end
    def update
        
        if @job_post.update params.require(:job_post)
        .permit(
            :title,
            :description,
            :min_salary,
            :max_salary,
            :company_name,
            :location)
            redirect_to @job_post
        end
    end
    def destroy
        
        @job_post.destroy
        flash[:danger]= 'deleted job post'
        redirect_to job_posts_path
    end
    private
    def find_job_post
        @job_post=JobPost.find params[:id]
    end
end