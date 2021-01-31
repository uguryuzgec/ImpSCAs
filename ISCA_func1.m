function [Leader_score,Leader_pos,Convergence_curve]= ISCA_func1(SearchAgents_no,Max_iter,lb,ub,dim,fobj)

 rand('state',sum(100*clock));
N=SearchAgents_no;
fitcount=N;
fhd=fobj;
    % Search agent no
   
    %Dimension
   
	
    % Max iteration
    Max_iteration=Max_iter;
    
 
    if length(lb)==1
        lb=repmat(lb,1,dim);
        ub=repmat(ub,1,dim);
    end
    
    lb=repmat(lb,N,1);
    ub=repmat(ub,N,1);
% % %     X=X_suru;
    X=lb+(ub-lb).*rand(N,dim);
     for i=1:size(X,1)       
        e(1,i)=feval(fhd,X(i,:));   
    end
	fit=e;
	pop=X;
    [gbestval,gbestid]=min(e);
    gbest=X(gbestid,:);%initialize the gbest and the gbest's fitness value
    gbest_position(1,:)=gbest;
    
 
    
    %Main loop
    t=0;k=1;
     % start from the second iteration since the first iteration was dedicated to calculating the fitness
    while t<Max_iteration
       
        % Eq. (3.4)
        a = 2;
        r1=a-k*((a)/Max_iteration); % r1 decreases linearly from a to 0
        % Update the position of solutions with respect to destination
        for i=1:size(X,1) % in i-th solution
%             rs=randi([1,dim]);
        

            for j=1:size(X,2) % in j-th dimension

                % Update r2, r3 for Eq. (3.3)
                r2=(2*pi)*rand();
                r3=2*rand;
				%1. (sin+cos)/2 iyi
                X(i,j)= pop(i,j)+(r1.*0.5*(sin(r2)+cos(r2)).*abs(r3.*gbest(j)-pop(i,j)));
                        
            end
            %mutasyon hepsinde olacak
            if rand()<0.005
				nmu=ceil(0.1*dim);
				j=randsample(dim,nmu);
                sigma=0.1*(ub(1)-lb(1));
                X(i,j)=X(i,j)+sigma.*randn(size(j))';
			end
        end
                        
        % boundary checking mechanism
        X=((X>=lb) & (X<=ub)).*X...
                + (X<lb).*(lb+0.25.*(ub-lb).*rand(N,dim))+(X>ub).*(ub-0.25.*(ub-lb).*rand(N,dim));
        
		
        for i=1:size(X,1)       
            e(1,i)=feval(fhd,X(i,:));   
         end
        fitcount=fitcount+N;
		tmp=(fit<e);
		temp=repmat(tmp',1,dim);
		pop=temp.*pop+(1-temp).*X;
		fit=tmp.*fit+(1-tmp).*e; 
		[gbestval,index]=min(fit);
        gbest=pop(index,:);
			
	     k=k+1;
        t=t+1;
       Convergence_curve(t)=gbestval;
       

    end
    Leader_score=gbestval;
          Leader_pos = gbest;
       
end
