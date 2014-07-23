function O=drawBbox(DE)

O=im2double(imread(DE.view_name));
    bcolor=[255 0 0];
if size(O,3)==1
    O=repmat(O,[1 1 3]);
end
bcolor=reshape(bcolor,[1 1 3]);
bbox=round([DE.x_min DE.y_min DE.x_max DE.y_max]);

% O(bbox(1):bbox(3),bbox(2):bbox(2),:)=repmat(bcolor,[bbox(3)-bbox(1)+1 1 1]);
% O(bbox(1):bbox(3),bbox(4):bbox(4),:)=repmat(bcolor,[bbox(3)-bbox(1)+1 1 1]);
% O(bbox(1):bbox(1),bbox(2):bbox(4),:)=repmat(bcolor,[1 bbox(4)-bbox(2)+1 1]);
% O(bbox(3):bbox(3),bbox(2):bbox(4),:)=repmat(bcolor,[1 bbox(4)-bbox(2)+1 1]);
% O(bbox(1):bbox(3),bbox(2):bbox(2)+1,:)=repmat(bcolor,[bbox(3)-bbox(1)+1 2 1]);
% O(bbox(1):bbox(3),bbox(4):bbox(4)+1,:)=repmat(bcolor,[bbox(3)-bbox(1)+1 2 1]);
% O(bbox(1):bbox(1)+1,bbox(2):bbox(4),:)=repmat(bcolor,[2 bbox(4)-bbox(2)+1 1]);
% O(bbox(3):bbox(3)+1,bbox(2):bbox(4),:)=repmat(bcolor,[2 bbox(4)-bbox(2)+1
% 1]);
for dx=-1:1
    for dy=-1:1
try
O(bbox(2)+dy:bbox(4)+dy,bbox(1)+dx,:)=repmat(bcolor,[bbox(4)-bbox(2)+1 1 1]);
end
try
O(bbox(2)+dy,bbox(1)+dx:bbox(3)+dx,:)=repmat(bcolor,[1 bbox(3)-bbox(1)+1 1]);
end
try
O(bbox(2)+dy:bbox(4)+dy,bbox(3)+dx,:)=repmat(bcolor,[bbox(4)-bbox(2)+1 1 1]);
end
try
O(bbox(4)+dy,bbox(1)+dx:bbox(3)+dx,:)=repmat(bcolor,[1 bbox(3)-bbox(1)+1 1]);
end
    end
end