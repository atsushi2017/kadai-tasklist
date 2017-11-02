class TasksController < ApplicationController
	
  def index
		@tasks = Task.all.order("created_at DESC")
  end
	
  def show
    # /tasks/:id    => task#show
		@task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if (@task.save)
      # 正常終了
      redirect_to @task
    else
      #バリデーション結果が不正だったとき
    end
  end
	
  def edit
	  @task= Task.find(params[:id])
  end

  def update
    # /tasks/:id   method: PATCH, 
    @task = Task.find(params[:id])
    if (@task.update(task_params))
      # 正常更新
      redirect_to @task
    else
      #バリデーションにひっかかった不正な入力
    end
  end
  
  def destroy
    @Task = Task.find(params[:id])
    @Task.destroy

    flash[:success] = 'Task は正常に削除されました'
    redirect_to root_url
  end
  
  private
  
  def task_params
    params.require(:task).permit(:content, :status)
  end
end
