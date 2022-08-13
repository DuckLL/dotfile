# ref https://blog.jhangy.us/post/create-ramdisk-on-macos/
###設定Ramdisk大小，單位(MB)###
SIZE=8192
####磁碟名稱###
DISKNAME=Ramdisk
###取得Home資料夾路徑##
HOME_DIR=$(cd ~;pwd)
###要轉移到Ramdisk的資料夾清單###
declare -a PATH_LIST=("Library/Caches/Adobe Camera Raw 2" "Library/Caches/Homebrew" \
"Library/Caches/com.spotify.client" "Library/Caches/ru.keepcoder.Telegram" "Library/Caches/com.hnc.Discord" \
"Library/Caches/com.microsoft.VSCode" "Library/Caches/pip")

###當Ramdisk不存在時建立他###
if [[ ! -d /Volumes/${DISKNAME} ]]; then
	DISK_ID=`hdiutil attach -nomount ram://$(( ${SIZE} * 1024 * 1024 / 512 ))`
	diskutil partitionDisk $DISK_ID GPT APFS "${DISKNAME}" 0
fi
###把轉移資料夾的過程寫成function###
create_symbolic_link(){
	if [[ ! -d /Volumes/${DISKNAME}/${LINK_PATH} ]]; then
		echo "    Create /Volumes/${DISKNAME}/${LINK_PATH} Directory"
		mkdir -p "/Volumes/${DISKNAME}/${LINK_PATH}"
	fi
	if [[ -d ${HOME_DIR}/${LINK_PATH} ]] && [[ ! -h ${HOME_DIR}/${LINK_PATH} ]];then
		echo "    Delete ${HOME_DIR}/${LINK_PATH}"
		rm -rf "${HOME_DIR}/${LINK_PATH}"
	fi
	if [[ ! -h ${HOME_DIR}/${LINK_PATH} ]];then
		ln -s "/Volumes/${DISKNAME}/${LINK_PATH}" "${HOME_DIR}/${LINK_PATH}"
		echo "    ...finish linking ${LINK_PATH}\n"
	fi
}

###移動到Ramdisk磁碟###
cd /Volumes/${DISKNAME}
###依照清單內容轉移資料夾###
for LINK_PATH in "${PATH_LIST[@]}";
do
	echo "linking ${LINK_PATH}"
	create_symbolic_link ${LINK_PATH}
done
echo ""
###依照清單內容建立空資料夾###
for EMPTY_FOLDER in "${EMPTY_PATH_LIST[@]}";
do
	echo "linking ${EMPTY_FOLDER}"
	create_empty_folder ${EMPTY_FOLDER}
done