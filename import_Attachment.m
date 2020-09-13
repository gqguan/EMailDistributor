function [Mails,allOK] = import_Attachment(Mails)
% ����������
if nargin ~= 1 || ~isstruct(Mails)
    fprintf('[����]�����������\n');
    return
end
% ��ʼ��
allOK = true;
% ѡȡ�����ļ��������
[Files, Path] = uigetfile('*.*', 'ѡȡ�����ļ� ...', 'Multiselect', 'on');
Files = cellstr(Files);
Path = cellstr(Path);
FullPaths = strcat(Path, Files);
% ������������ѡ����
for i = 1:length(Mails)
    idxFile = cellfun(@(x)(contains(x,Mails(i).Recipient.Name)),Files);
    text = sprintf('%s��%s��ͬѧ��\n\n��ã�\n',Mails(i).Recipient.Name,Mails(i).Recipient.SN);
    if sum(idxFile) == 1
        Mails(i).Attachment = FullPaths(idxFile);
        text = [text,sprintf('�������Ҫ���ֽ����ĺ�Ŀγ̱��棨�������pdf�ļ������ظ��㣬����գ�\n\n')];
        ok = true;
    else
        if sum(idxFile) == 0
            Mails(i).Remarks = sprintf('[����]û�з��ָ����ļ���%sƥ�䡣\n', Mails(i).Recipient.Name);
            text = [text,sprintf('û�з������ύ�Ŀγ̱��棬��������ϵ!\n\n')];
            ok = true;
        else
            fprintf('[����]���ִ��ڶ�������ļ���%sƥ�䡣\n', Mails(i).Recipient.Name)
            ok = false;
            allOK = false;
        end
    end
    if ok
        text = [text,sprintf('��\n\n�ع�ǿ\n\n')];
        text = [text,sprintf('�ʼ��������ɳ���https://github.com/gqguan/EMailDistributor����%s',char(datetime('now')))];
        Mails(i).Content = text;
    end
end