#!/bin/bash
# 这是一个写 wiki 的命令, 用法在 $usage 里边

# 声明变量
dir='/home/zhang/gitpath/note'
chaos='/home/zhang/gitpath/note/chaos'
time=$( date +"%m-%d-%H:%M:%S" )
usage="ww 命令的用法如下: \n    ww : 打开未整理 wiki 的首页;\n   ww 主题名;创建主题或打开该主题的首页;\n    ww [s|g|f|l] 内容名: 为未整理 wiki 相应分类添加内容;\n    ww [s|g|f|l] 内容名 主题名: 为主题的相应分类添加内容"

# 判断传入参数数量
case $# in
    0)
        # 如果没有参数, 直接打开未理整 wiki 的首页
        vim $chaos/index.md
        ;;
    1)
        # 如果有一个参数, 创建一个主题, 并打开首页, 前提是, 这个参数不是选项
        case $1 in
            s|g|f|l|n)
                echo $usage
                ;;
            w)
                vim ${chaos}/navigation.md
                ;;
            t)
                bash /home/zhang/myScript/writeNoteContent.sh $chaos $time 随笔记
                ;;
            *)
                bash /home/zhang/myScript/mksub.sh $1
                ;;
        esac
        ;;
    2) 
        # 如果有两个参数, 第一个参数一定是选项, 通过选项确定分类, 并以在未整理 wiki 下, 创建以第二个参数为名的内容
        case $1 in
#           s)
#               bash /home/zhang/myScript/writeNoteContent.sh $chaos $2 事实
#               ;;
#           g)
#               bash /home/zhang/myScript/writeNoteContent.sh $chaos $2 观点
#               ;;
#           f)
#               bash /home/zhang/myScript/writeNoteContent.sh $chaos $2 方法
#               ;;
#           l)
#               bash /home/zhang/myScript/writeNoteContent.sh $chaos $2 逻辑
#               ;;
            w)
                if [ -d ${dir}/${2} ]; then
                    vim ${dir}/${2}/navigation.md
                else
                    echo "请选创建主题"
                fi
                ;;
            n)
                if [ -f ${dir}/${2}.md ]; then
                    vim ${dir}/${2}.md
                else
                    bash /home/zhang/myScript/writeNoteContent.sh $chaos $2 未整理
                fi
                ;;
            *)
                echo $usage
                ;;
            esac
            ;;
        3)
            # 如果传入三个参数, 第一个为选项, 第二个为内容名, 第三个为主题名
            case $1 in 
                n)
                    if [ ! -d $dir/$3 ]; then
                        echo '请先创建主题'
                    else 
                        bash /home/zhang/myScript/writeNoteContent.sh $dir/$3 $2 未整理
                    fi
                    ;;
                s)
                    if [ ! -d $dir/$3 ]; then
                        echo '请先创建主题'
                    else 
                        bash /home/zhang/myScript/writeNoteContent.sh $dir/$3 $2 事实
                    fi
                    ;;
                g)
                    if [ ! -d $dir/$3 ]; then
                        echo '请先创建主题'
                    else 
                        bash /home/zhang/myScript/writeNoteContent.sh $dir/$3 观点
                    fi
                    ;;
                f)
                    if [ ! -d $dir/$3 ]; then
                        echo '请先创建主题'
                    else 
                        bash /home/zhang/myScript/writeNoteContent.sh $dir/$3 $2 方法
                    fi
                    ;;
                l)
                    if [ ! -d $dir/$3 ]; then
                        echo '请先创建主题'
                    else 
                        bash /home/zhang/myScript/writeNoteContent.sh $dir/$3 $2 逻辑
                    fi
                    ;;
                *)
                    if [! -d $dir/$3]; then
                        echo '请选创建主题'
                    else
                        bash /home/zhang/myScript/writeNoteContent.sh $dir/$3 $2 $1
                    fi
                    ;;
            esac
            ;;
        *)
            echo $usage
            ;;
esac
