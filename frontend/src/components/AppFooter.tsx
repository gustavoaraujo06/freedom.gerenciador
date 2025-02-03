import React from 'react'

import { CFooter } from '@coreui/react-pro'

const AppFooter = () => {
  return (
    <CFooter>
      <div>
        <span className="ms-1">© 2025 <a href='https://freedomit.com.br' target='_blank'>Freedom IT</a>.</span>
      </div>
    </CFooter>
  )
}

export default React.memo(AppFooter)
