# 插件：nfc-app-lib-sync

# 查找最新的 nfc-app-lib* 文件夹，支持空格
function _find_latest_nfc_folder {
  local download_dir="${NFC_DOWNLOAD_DIR:-$HOME/Downloads}"
  find "$download_dir" -maxdepth 1 -type d -name 'nfc-app-lib*' -exec ls -dt {} + 2>/dev/null | head -n1
}

function cpios {
  local download_dir="${NFC_DOWNLOAD_DIR:-$HOME/Downloads}"
  local latest="$(_find_latest_nfc_folder)"
  local target_dir="./ios/DeviceUtils"

  if [[ ! -d "$target_dir" ]]; then
    echo "目标路径 $target_dir 不存在，请确认当前目录是否正确。"
    return 1
  fi

  if [[ -n "$latest" ]]; then
    echo "使用最新 nfc-app-lib 目录: $latest"
    echo "正在复制 jni 文件到 iOS 工程目录..."
    rsync -av \
      --exclude='Android.mk' \
      --exclude='Application.mk' \
      --exclude='deviceLibJNI.c' \
      "$latest/jni/" \
      "$target_dir/"
  else
    echo "未在 $download_dir 中找到以 nfc-app-lib 开头的文件夹。"
  fi
}

function cpandroid {
  local download_dir="${NFC_DOWNLOAD_DIR:-$HOME/Downloads}"
  local latest="$(_find_latest_nfc_folder)"
  local target_dir="./android/app/src/main/jniLibs"

  if [[ ! -d "$target_dir" ]]; then
    echo "目标路径 $target_dir 不存在，请确认当前目录是否正确。"
    return 1
  fi

  if [[ -n "$latest" ]]; then
    echo "使用最新 nfc-app-lib 目录: $latest"
    echo "正在复制 libs 文件到 Android 工程目录..."
    rsync -av \
      "$latest/libs/" \
      "$target_dir/"
  else
    echo "未在 $download_dir 中找到以 nfc-app-lib 开头的文件夹。"
  fi
}

function syncnfc() {
  cpios || return 1
  cpandroid || return 1
}
