function dashboard() {

  const investmendashboard = document.querySelectorAll(".investment-all-dashes")

  investmendashboard.forEach((investment) => {

    const iddash = investment.dataset.investment

    const yourtab = document.getElementById("investment-dash-tab-" + iddash)
    const alltabs = document.querySelectorAll(".all-investment-tabs")

    const yourdash = document.getElementById("main-dashboard-" + iddash)
    const alldashes = document.querySelectorAll(".investment-all-dashes")


    yourtab.addEventListener("click", (event) => {
      alltabs.forEach((tab) => {
        tab.classList.remove("active")
      })
      yourtab.classList.add("active")

      alldashes.forEach((dasboardcontent) => {
        dasboardcontent.classList.add("dashboard-hide")
      })
      yourdash.classList.remove("dashboard-hide")
    })
  })
}

function dashboardtab() {
  const cards = document.querySelectorAll(".investment-all-dashes")

  cards.forEach((card) => {
    const idtab = card.dataset.investmentprod

    const yourdaytab = document.getElementById("yourdaytab-" + idtab)
    const yourmonthtab = document.getElementById("yourmonthtab-" + idtab)
    const youryearstab = document.getElementById("youryearstab-" + idtab)

    // for some reason not recognizing these ids
    const dailyproduction = document.getElementById(`daily-production-${idtab}`)
    const monthlyproduction = document.getElementById("monthly-production-" + idtab)
    const yearlyproduction = document.getElementById("yearly-production-" + idtab)

    const yourincometab = document.getElementById("yourincometab-" + idtab)
    const yourdurationtab = document.getElementById("yourdurationtab-" + idtab)

    const incomebox = document.getElementById(`income-box-${idtab}`)
    const durationbox = document.getElementById("duration-box-" + idtab)

    yourdaytab.addEventListener("click", (event) => {
      yourdaytab.classList.add("active")
      yourmonthtab.classList.remove("active")
      youryearstab.classList.remove("active")
      dailyproduction.classList.remove("dashboard-hide")
      monthlyproduction.classList.add("dashboard-hide")
      yearlyproduction.classList.add("dashboard-hide")
    })

    yourmonthtab.addEventListener("click", (event) => {
      yourdaytab.classList.remove("active")
      yourmonthtab.classList.add("active")
      youryearstab.classList.remove("active")
      dailyproduction.classList.add("dashboard-hide")
      monthlyproduction.classList.remove("dashboard-hide")
      yearlyproduction.classList.add("dashboard-hide")
    })

    youryearstab.addEventListener("click", (event) => {
      yourdaytab.classList.remove("active")
      yourmonthtab.classList.remove("active")
      youryearstab.classList.add("active")
      dailyproduction.classList.add("dashboard-hide")
      monthlyproduction.classList.add("dashboard-hide")
      yearlyproduction.classList.remove("dashboard-hide")
    })

    yourincometab.addEventListener("click", (event) => {
      yourincometab.classList.add("active")
      yourdurationtab.classList.remove("active")
      incomebox.classList.remove("dashboard-hide")
      durationbox.classList.add("dashboard-hide")
    })

    yourdurationtab.addEventListener("click", (event) => {
      yourincometab.classList.remove("active")
      yourdurationtab.classList.add("active")
      incomebox.classList.add("dashboard-hide")
      durationbox.classList.remove("dashboard-hide")
    })

  })
}

export { dashboard }
export { dashboardtab }
