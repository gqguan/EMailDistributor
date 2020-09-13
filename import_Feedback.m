function data = import_Feedback(workbookFile, sheetName, range)
%IMPORTFILE 导入电子表格中的数据
%   DATA = IMPORTFILE(FILE) 读取名为 FILE 的 Microsoft Excel
%   电子表格文件的第一张工作表中的数据，并以元胞数组的形式返回该数据。
%
%   DATA = IMPORTFILE(FILE,SHEET) 从指定的工作表中读取。
%
%   DATA = IMPORTFILE(FILE,SHEET,RANGE) 从指定的工作表和指定的范围中读取。使用语法 'C1:C2'
%   指定范围，其中 C1 和 C2 是区域的对角。%
% 示例:
%   Untitled = importfile('能源化工专业“前沿讲座”课程意见反馈调查(1-26).xlsx','Sheet1','A2:P27');
%
%   另请参阅 XLSREAD。

% 由 MATLAB 自动生成于 2020/09/13 11:53:18

%% 输入处理

% 若没指定workbookFile，则打开文件对话框
if nargin == 0 
    [workbookFile, workbookPath] = uigetfile('*.*', '选取意见反馈调查结果Excel工作簿 ...', 'Multiselect', 'off');
end

% 如果未指定工作表，则将读取第一张工作表
if nargin == 1 || ~exist('sheetName','var')
    sheetName = 1;
end

% 如果未指定范围，则将读取所有数据
if nargin <= 2 || ~exist('range','var')
    range = '';
end

%% 导入数据
[~, ~, data] = xlsread([workbookPath,workbookFile], sheetName, range);
data(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),data)) = {''};

idx = cellfun(@ischar, data);
data(idx) = cellfun(@(x) string(x), data(idx), 'UniformOutput', false);
% 删除表头，只保留姓名、学号和邮件信息
data = data(2:end,[6 7 10]);
% 删除空邮件地址的行
data = data(cellfun(@(x)(x~=""),data(:,3)),:);
