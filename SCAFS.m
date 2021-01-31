function [Leader_score,Leader_pos,Convergence_curve]=SCAFS(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
% fName = 'SCA';
 rand('state',sum(100*clock));
N=SearchAgents_no;
fitcount=N;
fhd=fobj;
	
      Max_iteration=Max_iter;
    if length(lb)==1
        lb=repmat(lb,1,dim);
        ub=repmat(ub,1,dim);
    end
 
    lb=repmat(lb,N,1);
    ub=repmat(ub,N,1);
  %%%  X=X_suru;
    X=lb+(ub-lb).*rand(N,dim);
%     e =feval(fhd,X');
    for i=1:size(X,1)       
        e(1,i)=feval(fhd,X(i,:));   
    end
    
    [gbestval,gbestid]=min(e);
    gbest=X(gbestid,:);%initialize the gbest and the gbest's fitness value
    
     %Main loop
    t=[];k=1; ite=0;
     while ite<Max_iter
        a = 2;
        r1=a-k*((a)/Max_iteration);
        for i=1:size(X,1) % in i-th solution
%             rs=randi([1,dim]);
            for j=1:size(X,2) % in j-th dimension

                % Update r2, r3, and r4 for Eq. (3.3)
                r2=(2*pi)*rand();
                r3=2*rand;
                r4=rand();

                % Eq. (3.3)
                if r4<0.5
                    % Eq. (3.1) 
                    X(i,j)= X(i,j)+(r1.*sin(r2).*abs(r3.*gbest(j)-X(i,j)));
                else
                    % Eq. (3.2)
                    X(i,j)= X(i,j)+(r1.*cos(r2).*abs(r3.*gbest(j)-X(i,j)));
                end
            end
        end
        X=((X>=lb) & (X<=ub)).*X...
                + (X<lb).*lb+(X>ub).*ub;
         
           
            for i=1:size(X,1)       
            fit(1,i)=feval(fhd,X(i,:));   
            end
		fitcount=fitcount+N;
        for i=1:size(X,1)   
            % Update the destination if there is a better solution
            if fit(1,i)<gbestval
                gbest=X(i,:);
                gbestval=fit(1,i);
            end
        end
        
        k=k+1;
      
       ite=ite+1;
       Convergence_curve(ite)=gbestval;
     end
     Leader_score=gbestval;
           Leader_pos = gbest;
       
end
