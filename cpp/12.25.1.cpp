#include <windows.media.capture.h>
#include <windows.media.h>
#include <wrl.h>
#include <wrl/client.h>
#include <iostream>

using namespace Microsoft::WRL;
using namespace Windows::Media::Capture;
using namespace Windows::Media::Capture::Frames;
using namespace Windows::Foundation::Collections;

int main()
{
    // Initialize MediaCapture
    ComPtr<MediaCapture> mediaCapture = Make<MediaCapture>();
    MediaCaptureInitializationSettings settings;
    settings.StreamingCaptureMode = StreamingCaptureMode::Video;
    mediaCapture->InitializeAsync(settings).get();

    // Find the IR camera
    auto frameSourceGroups = MediaFrameSourceGroup::FindAllAsync().get();
    for (auto group : frameSourceGroups)
    {
        for (auto sourceInfo : group->SourceInfos)
        {
            if (sourceInfo->SourceKind == MediaFrameSourceKind::Infrared)
            {
                std::wcout << L"Found IR camera: " << sourceInfo->Id->Data() << std::endl;
                // Do something with the IR camera
            }
        }
    }

    return 0;
}
