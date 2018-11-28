function block1 = coloredge(block1, i)

if (i == 1)
block1(1:7, :, 1) = 1;block1(1:7, :, 2) = 0;block1(1:7, :, 3) = 0;
block1(:, 1:7, 1) = 1;block1(:, 1:7, 2) = 0;block1(:, 1:7, 3) = 0;
block1(end-6:end, :, 1) = 1;block1(end-6:end, :, 2) = 0;block1(end-6:end, :, 3) = 0;
block1(:, end-6:end, 1) = 1;block1(:, end-6:end, 2) = 0;block1(:, end-6:end, 3) = 0;
end

if (i == 2)
block1(1:7, :, 1) = 0;block1(1:7, :, 2) = 1;block1(1:7, :, 3) = 0;
block1(:, 1:7, 1) = 0;block1(:, 1:7, 2) = 1;block1(:, 1:7, 3) = 0;
block1(end-6:end, :, 1) = 0;block1(end-6:end, :, 2) = 1;block1(end-6:end, :, 3) = 0;
block1(:, end-6:end, 1) = 0;block1(:, end-6:end, 2) = 1;block1(:, end-6:end, 3) = 0;
end

if (i == 3)
block1(1:7, :, 1) = 0;block1(1:7, :, 2) = 0;block1(1:7, :, 3) = 1;
block1(:, 1:7, 1) = 0;block1(:, 1:7, 2) = 0;block1(:, 1:7, 3) = 1;
block1(end-6:end, :, 1) = 0;block1(end-6:end, :, 2) = 0;block1(end-6:end, :, 3) = 1;
block1(:, end-6:end, 1) = 0;block1(:, end-6:end, 2) = 0;block1(:, end-6:end, 3) = 1;
end

if (i == 4)
block1(1:7, :, 1) = 1;block1(1:7, :, 2) = 1;block1(1:7, :, 3) = 1;
block1(:, 1:7, 1) = 1;block1(:, 1:7, 2) = 1;block1(:, 1:7, 3) = 1;
block1(end-6:end, :, 1) = 1;block1(end-6:end, :, 2) = 1;block1(end-6:end, :, 3) = 1;
block1(:, end-6:end, 1) = 1;block1(:, end-6:end, 2) = 1;block1(:, end-6:end, 3) = 1;
end