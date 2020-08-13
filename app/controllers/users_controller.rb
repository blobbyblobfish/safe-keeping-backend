class UsersController < ApplicationController
    before_action :find, only: [:update, :destroy]

    def index
        render json: User.all
    end

    def show
        @user = User.find(params[:id])
        render json: @user
    end

    def create
        @user = User.create(create_user_params)

        if @user.valid?
            token = encode_token({user_id: @user.id})
            
            # Seed users with initial tracker and coping skills
            Tracker.create(user: @user, name: "Mood")

            # Text taken from various sources
            # Ask for support: https://www.verywellmind.com/forty-healthy-coping-skills-4586742
            # Mindfulness description: https://healthcenter.gwu.edu/sites/g/files/zaxdzs1216/f/downloads/Mindfulness.pdf
            # Mindfulness steps: https://happyproject.in/mindfulness-7-steps/
            # Take a break: https://www.mentalhealth.org.uk/your-mental-health/looking-after-your-mental-health/take-break#:~:text=A%20change%20of%20scene%20or,enough%20to%20de%2Dstress%20you.
            skills = [{
                name: "Mindfulness",
                description: "Mindfulness means maintaining a moment-by-moment awareness of our thoughts, feelings, bodily sensations, and surrounding environment, without judgment.",
                directions: "Step 1: Take a deep breath and start to relax. \n\nStep 2: Close your eyes and drop all of your concerns. \n\nStep 3: Bring whole of the awareness into breathing."
            }, {
                name: "Take A Break",
                description: "A change of scene or a change of pace is good for your mental health",
                directions: "Write up a list of helpful breaks or distractions. These can be any activity you enjoy doing, such as going for a walk, making a cup of tea, or doing nothing."
            }, {
                name: "Ask For Help",
                description: "It can be healthy to talk about your problems so that you can gain support, develop a solution, or see a problem in a different way.",
                directions: "Have a conversation with a friend or a professional who you feel comfortable going to for listening and guidance."
            }]
            
            skills.each {|s| CopingSkill.create(user: @user, name: s[:name], description: s[:description], directions: s[:directions], attempts: 0, successful_attempts: 0)}
            
            render json: {
                user: UserSerializer.new(@user),
                token: token
            }

        else 
            render json: {
                error: "Error. Registration not successful."
            }
        end

    end

    def update
        @user.update(update_user_params)
        render json: @user
    end

    def destroy
        @user.destroy()
        render json: @user
    end

    def find
        @user = User.find(params[:id])
    end

    def login
        @user = User.find_by(email: params[:email])

        if @user && @user.authenticate(params[:password])
            token = encode_token({user_id: @user.id})

            render json: {
              user: UserSerializer.new(@user),
              token: token
            }
    
        else
            render json: {error: "Cannot login."}
        end

    end

    private

    def create_user_params
        params.permit(:email, :first_name, :password)
    end

    def update_user_params
        params.require(:user).permit(:email, :first_name)
    end
end
