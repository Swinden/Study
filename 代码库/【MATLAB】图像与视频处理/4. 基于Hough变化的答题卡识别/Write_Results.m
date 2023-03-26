function Write_Results()
for i = 1 : 3
    figure(i);
    f = getframe(gcf);
    f = frame2im(f);
    imwrite(f, sprintf('results\\result%d.png', i));
end