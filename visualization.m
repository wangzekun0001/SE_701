function visualization(f,s,J)
%ø… ”ªØ
clf(f);
axis off;
axes('ycolor',get(f,'color'),'ytick',[])
hold on;
color = ['b','g','m','c','y',[0.2417,0.4039,0.0965],[0.1320,0.9421,0.9561]];
for j = 1: numel(s)
    plot(s(j),0, strcat('.',color(j)),'MarkerSize',69);
    %plot([s(j)-rs,s(j)+rs],[0,0],color(j),'linewidth',5);
end
hold off;
drawnow
