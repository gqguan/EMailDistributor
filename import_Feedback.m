function data = import_Feedback(workbookFile, sheetName, range)
%IMPORTFILE ������ӱ���е�����
%   DATA = IMPORTFILE(FILE) ��ȡ��Ϊ FILE �� Microsoft Excel
%   ���ӱ���ļ��ĵ�һ�Ź������е����ݣ�����Ԫ���������ʽ���ظ����ݡ�
%
%   DATA = IMPORTFILE(FILE,SHEET) ��ָ���Ĺ������ж�ȡ��
%
%   DATA = IMPORTFILE(FILE,SHEET,RANGE) ��ָ���Ĺ������ָ���ķ�Χ�ж�ȡ��ʹ���﷨ 'C1:C2'
%   ָ����Χ������ C1 �� C2 ������ĶԽǡ�%
% ʾ��:
%   Untitled = importfile('��Դ����רҵ��ǰ�ؽ������γ������������(1-26).xlsx','Sheet1','A2:P27');
%
%   ������� XLSREAD��

% �� MATLAB �Զ������� 2020/09/13 11:53:18

%% ���봦��

% ��ûָ��workbookFile������ļ��Ի���
if nargin == 0 
    [workbookFile, workbookPath] = uigetfile('*.*', 'ѡȡ�������������Excel������ ...', 'Multiselect', 'off');
end

% ���δָ���������򽫶�ȡ��һ�Ź�����
if nargin == 1 || ~exist('sheetName','var')
    sheetName = 1;
end

% ���δָ����Χ���򽫶�ȡ��������
if nargin <= 2 || ~exist('range','var')
    range = '';
end

%% ��������
[~, ~, data] = xlsread([workbookPath,workbookFile], sheetName, range);
data(cellfun(@(x) ~isempty(x) && isnumeric(x) && isnan(x),data)) = {''};

idx = cellfun(@ischar, data);
data(idx) = cellfun(@(x) string(x), data(idx), 'UniformOutput', false);
% ɾ����ͷ��ֻ����������ѧ�ź��ʼ���Ϣ
data = data(2:end,[6 7 10]);
% ɾ�����ʼ���ַ����
data = data(cellfun(@(x)(x~=""),data(:,3)),:);
