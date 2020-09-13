function [Mails,allOK] = import_Attachment(Mails)
% 检查输入参数
if nargin ~= 1 || ~isstruct(Mails)
    fprintf('[错误]参数输入错误！\n');
    return
end
% 初始化
allOK = true;
% 选取附件文件（多个）
[Files, Path] = uigetfile('*.*', '选取附件文件 ...', 'Multiselect', 'on');
Files = cellstr(Files);
Path = cellstr(Path);
FullPaths = strcat(Path, Files);
% 按名单查找所选附件
for i = 1:length(Mails)
    idxFile = cellfun(@(x)(contains(x,Mails(i).Recipient.Name)),Files);
    text = sprintf('<p>%s（%s）同学：</p>',Mails(i).Recipient.Name,Mails(i).Recipient.SN);
    text = [text,'<p>你好！</p>'];
    if sum(idxFile) == 1
        Mails(i).Attachment = FullPaths(idxFile);
        text = [text,sprintf('<p>根据你的要求，现将批改后的课程报告（详见附件pdf文件）返回给你，请查收！</p>')];
        ok = true;
    else
        if sum(idxFile) == 0
            Mails(i).Remarks = sprintf('[警告]没有发现附件文件与%s匹配。\n', Mails(i).Recipient.Name);
            text = [text,sprintf('<p>没有发现你提交的课程报告，请与我（gqguan@scut.edu.cn）联系!</p>')];
            ok = true;
        else
            fprintf('[警告]发现存在多个附件文件与%s匹配。\n', Mails(i).Recipient.Name)
            ok = false;
            allOK = false;
        end
    end
    if ok
        text = [text,'<p>礼</p>'];
        text = [text,'<p>关国强</p>'];
        text = [text,'<a href="https://github.com/gqguan/EMailDistributor">邮件内容生成程序</a>'];
        text = [text,sprintf('<p>%s</p>',char(datetime('now')))];
        Mails(i).Content = text;
    end
end