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
    text = sprintf('<p>%s��%s��ͬѧ��</p>',Mails(i).Recipient.Name,Mails(i).Recipient.SN);
    text = [text,'<p>��ã�</p>'];
    if sum(idxFile) == 1
        Mails(i).Attachment = FullPaths(idxFile);
        text = [text,sprintf('<p>�������Ҫ���ֽ����ĺ�Ŀγ̱��棨�������pdf�ļ������ظ��㣬����գ�</p>')];
        ok = true;
    else
        if sum(idxFile) == 0
            Mails(i).Remarks = sprintf('[����]û�з��ָ����ļ���%sƥ�䡣\n', Mails(i).Recipient.Name);
            text = [text,sprintf('<p>û�з������ύ�Ŀγ̱��棬�����ң�gqguan@scut.edu.cn����ϵ!</p>')];
            ok = true;
        else
            fprintf('[����]���ִ��ڶ�������ļ���%sƥ�䡣\n', Mails(i).Recipient.Name)
            ok = false;
            allOK = false;
        end
    end
    if ok
        text = [text,'<p>��</p>'];
        text = [text,'<p>�ع�ǿ</p>'];
        text = [text,'<a href="https://github.com/gqguan/EMailDistributor">�ʼ��������ɳ���</a>'];
        text = [text,sprintf('<p>%s</p>',char(datetime('now')))];
        Mails(i).Content = text;
    end
end