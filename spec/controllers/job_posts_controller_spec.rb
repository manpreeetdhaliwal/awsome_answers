require 'rails_helper'
# rails g rspec:controller job_posts --controller-specs --no-request-specs
RSpec.describe JobPostsController, type: :controller do
    describe '#new' do # 👈🏻 describe 'new' starts here 
        it 'render the new template' do
            # Given

            # When
            get(:new)

            # Then
            expect(response).to(render_template(:new)) #👈🏻 We wverify that the response will render out the tempalte called 'new' using the matcher 'render_template'
            # response is an object that re-presents the HTTP- Response
            # Rspec makes this opbejct available within the specs
        end
        it 'sets an instance variable with new job posts' do
            # Given
            # When
            get(:new)
            # Then
            expect(assigns(:job_post)).to(be_a_new(JobPost))
            # assign(:job_past) is available from the 'rail-controller-testing'. this allows you to grab an instance varaibale, it takes symbol(:job_post)- the name of instance varaible
            # All models are available to controllers 
        end 
    end# 👈🏻 describe 'new' ends  here 
    describe '#create' do# 👈🏻 describe 'create' starts here 
        it 'creates a job post in the database' do
            # Given
            count_before = JobPost.count
            # When
            post(:create, params:{job_post: FactoryBot.attributes_for(:job_post)})
            # job_post:{
            #     title: 'senior dev',
            #     description: 'lots of pay',
            #     location: 'remote',
            #     min_salary:500_000,
            #     max_salary:1_000_000
            # }
            #Then
            count_after=JobPost.count
            expect(count_after).to(eq(count_before + 1))
        end
    end# 👈🏻 describe 'create' ends here 
end