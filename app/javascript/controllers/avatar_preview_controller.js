import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "imageUploader", "imagePreview", "previewSection", "crossSection", "initImage", "clearAvatar" ]

  connect() {
    this.isInit = null
    this.clearAvatarTarget.value == 1 ? (this.isInit = false) : (this.isInit = true)
    this.resetAvatar()
  }

  updatePreview() {
    this.imageUploaderTarget.files.length ? this.showPreview() : this.resetAvatar()    
  }

  showPreview() {
    console.log(this.imageUploaderTarget.value)
    console.log(typeof this.imageUploaderTarget.files)
    console.log(this.imageUploaderTarget.files)

    this.imagePreviewTarget.src = URL.createObjectURL(this.imageUploaderTarget.files[0])
    this.previewSectionTarget.classList.remove('d-none')
    this.initImageTarget.classList.add("d-none")
    this.crossSectionTarget.classList.add('d-none')
    this.clearAvatarTarget.value = 0
  }

  clearAvatar() {
    console.log("push the clear button")
    console.log(this.isInit)
    this.imageUploaderTarget.value = null
    this.previewSectionTarget.classList.add('d-none')
    this.initImageTarget.classList.add("d-none")
    this.crossSectionTarget.classList.remove('d-none')
    this.clearAvatarTarget.value = 1
  }

  resetAvatar() {
    console.log("push the reset button")
    console.log(this.isInit)
    
    this.imageUploaderTarget.value = null
    console.log(this.imageUploaderTarget.files)
    console.log(this.imageUploaderTarget.files.length)
    this.previewSectionTarget.classList.add('d-none')
    if (this.isInit) {
        this.initImageTarget.classList.remove("d-none")
        this.crossSectionTarget.classList.add('d-none')
        this.clearAvatarTarget.value = 0
        console.log("clearAvatar value: " + this.clearAvatarTarget.value.toString())
    } else {
        this.initImageTarget.classList.add("d-none")
        this.crossSectionTarget.classList.remove('d-none')
        this.clearAvatarTarget.value = 1
    }
  }









//   connect() {
//     this.updatePreview()
//   }
//   updatePreview() {
//     this.imageUploaderTarget.files.length ? this.showPreview() : this.hidePreview()    
//   }
//   showPreview() {
//     this.imagePreviewTarget.src = URL.createObjectURL(this.imageUploaderTarget.files[0])
//     this.addIconTarget.classList.add("d-none")
//     this.previewSectionTarget.classList.remove('d-none')
//   }
//   hidePreview() {
//     this.addIconTarget.classList.remove("d-none")
//     this.previewSectionTarget.classList.add('d-none')
//   }
//   clearUpload() {
//     this.imageUploaderTarget.value = null
//     this.updatePreview()
//   }


}
