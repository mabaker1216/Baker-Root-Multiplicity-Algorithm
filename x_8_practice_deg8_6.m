ans1=0;
l=1;
QB=AR8T;
r=length(QB);
%checkagainer=[];
checkagainer=zeros(1000000000,8,'int16');
dad=1;
%doublecheckagainer=[0,0];
%array must be sorted for program to work
% y is the sum being added to

while (l<=r)
    % If sum is greater
    if (isequal(QB(l,1:parsize)+QB(r,1:parsize),y))
       ya=QB(r,1:parsize);
       yya=r;        
       while (isequal(QB(r,1:parsize),ya))&&(r>=l)           
            bet=[QB(l,dgr),QB(l,dgr+1),QB(l,dgr+2),QB(l,dgr+3),QB(r,dgr),QB(r,dgr+1),QB(r,dgr+2),QB(r,dgr+3)];
            bet(bet==0)=[];
            if length(bet)==8
            checkagainer(dad,:)=sort(bet);
            dad=dad+1;
            end
            r=r-1;
       end
       r=yya;
       l=l+1;
    elseif (issortedrows([QB(l,1:parsize)+QB(r,1:parsize);y],1:parsize,'ascend'))
        l=l+1;
    %elseif (issortedrows([y;AR1T(l,1:parsize)+AR1T(r,1:parsize)],1:parsize,'ascend'))
    else
        r=r-1;
    end
end

checkagainer( all(~checkagainer,2), : ) = [];
checkagainer=unique(checkagainer,'rows');

for l1=1:length(checkagainer(:,5))
    [C,ia,ic]=unique(checkagainer(l1,:));
    a_counts=accumarray(ic,1);
    ch=vector_counter_DM(Roots(C(:),mplc),a_counts(:));
    mult(c,8)=mult(c,8)+ch;
end

mult(c,8);